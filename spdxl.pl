#!/usr/bin/perl

use warnings;
use strict;

=head1 NAME

spdxl.pl -- script that attempts to identify FOSS licenses and
corresponding files associated with them based on SPDX tags.

=head1 VERSION

Version 0.1.1

=cut

our $VERSION = '0.1.1';

=head1 SYNOPSIS

spdxl.pl [-cdfhv] [long options...] <args>

 -d STR --dir STR    Directory to search
 -f STR --fil STR    Single file to check
 -c --color          Color output
 -h --htmlout        Produce HTML output
 -v --verbose        Wordy
 --help              Print usage message and exit


=head1 LICENSE

 SPDX-License-Identifier: GPL-3.0
 This file is part of the SPDXL package.

 GNU Public License v3.0

 This program is free software; you can redistribute it and/or
 modify it under the terms of the GNU General Public License
 as published by the Free Software Foundation; either version 3
 of the License, or (at your option) any later version.

 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with this program; if not, write to the Free Software
 Foundation, Inc., 51 Franklin Street, Fifth Floor,
 Boston, MA 02110-1301, USA.

=head1 COPYRIGHT

 Copyright (C) 2015, Jeremiah C. Foster <jeremiah@jeremiahfoster.com>

=over

 List of changes:
 Aug. 2015, spdxl.pl, created file
 Feb. 2016, spdxl.pl, MVP working

=back

=head1 METHODS

=head2 main

 The main subroutine goes through all the files we've found, checks if
 its a directory, skip it if it is, print the file name if we've found
 a tag and then go through the file to pull out the identifier line.

=head2 nogit

 If we find a git repo, i.e. ".git" tell File::Find to ignore it.

=head2 htmlout

 HTML output works, but it means that we do not have any other output
 ATM. Plain text and colored ASCII text needs to be fixed next.

=cut

## TODO -- the first issue we'll face is the high likelyhood of being
## in a git dir. Obviously we'll want to switch to a git handling
## module for that work or we'll just ignore it which is probably a
## really bad idea since important data can be gleaned or even
## determined with a high degree of certainty.

## TODO -- in the future we'll use this data to put out a conformant
## SPDX doc

## Separate html output from text output, currently if you specify
## html output, it comes at the end of the text output.

use Path::Tiny;
use File::Find;
use File::Compare;
use File::Slurp;
use Getopt::Long::Descriptive;
use Pod::Usage;
use Term::ANSIColor;
use autodie;
use feature "say";

# --- Command line options
my ($opt, $usage) = describe_options
  ('spdxl.pl %o <args>',
   [ 'dir|d=s',    "Directory to search"            ],
   [ 'fil|f=s' ,   "Single file to check"           ],
   [ 'color|c',    "Color output"                   ],
   [ 'htmlout|h',  "Produce HTML output"            ],
   [ 'verbose|v',  "Wordy"                          ],
   [ 'help',       "Print usage message and exit"   ],
  );

if ($opt->fil) {
  print "File: " . $opt->fil . "\n" if $opt->verbose;
  check_each_line($opt->fil);
  exit;
}

print($usage->text), exit if $opt->help;
print "Searching through " . $opt->dir . "\n" if $opt->verbose;

# go through each dir
find(\&nogit, $opt->dir);

my @files;
sub nogit {
  /^\.git.*\z/s && ($File::Find::prune = 1)
    ||
    push @files,  $File::Find::name;
}

my (@lines, @spdxtags);
sub grep_for_tags {
  map {
    my ($row, $line);
    if (! -d $_) {
      @lines = read_file("$_");
      print "File: $_ "; # This prints the files we've found
      foreach my $line (@lines) {
	if ($line =~ /SPDX.?[Ll]ic/) {
	  chomp($line);
	  # Here we put the line in an array. Perhaps make a hash with
	  # file name and tag?
	  push @{ $spdxtags[$row++] }, $line;
	  if ($opt->color) { colored_output($line); }
	}
      } print "\n";
    }
  } @files;
}
grep_for_tags();

sub check_each_line {  # This should just build up the data structure, don't print anything
  my $file = shift;
  my ($row, $line);
  if (! -d $file) {
    @lines = read_file("$file");
    # print "File: $file " 
    foreach my $line (@lines) {
      if ($line =~ /SPDX.?[Ll]ic/) {
	chomp($line);
	# Here we put the line in an array. Perhaps make a hash with
	# file name and tag?
	push @{ $spdxtags[$row++] }, $line;
	# if ($opt->color) { colored_output($line) } else { print "$line"; }
      }
    } print "\n";
  }
}

sub colored_output {
  my $line = shift;
  print colored ['bright_yellow on_black'], "$line";
}

sub htmlout {
  use Text::Xslate;
  my $tx = Text::Xslate->new();
  my @tags = shift;
  my %vars = ( tags => \@tags,  );
  print $tx->render("spdxl.tx", \%vars);
}
# Create html output from the tags found if requested
htmlout(@spdxtags) if $opt->htmlout;

sub cmp_2_files {

  # Should the comparison short-circuit if hashsums match?

  # list of files names that match the regex below
  my (@licenses) = map { $_ } grep /^\.\/(?:LICEN[CS]E|COPYING)$/, @files;
  if (compare($licenses[0], $licenses[1]) == 0) {
    say "files identical.";
  }
  else { # If the files *don't* match
    say "files not identical.";
    use Text::Diff;
    # magic
  }
}

sub gitish {
  # git ls-files?
}

my $git_dir = path("./.git/");
if (-e $git_dir) {
  # handle the git dir
};


1;
