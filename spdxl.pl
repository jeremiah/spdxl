#!/usr/bin/perl

use warnings;
use strict;

=head1 NAME

spdxl.pl  -- script that attempts to identify FOSS licenses contained with files and directories.

=head1 VERSION

Version 0.1.0

=cut

our $VERSION = '0.1.0';

=head1 SYNOPSIS

This file is a script where many of the actions that spdxl executes
are stored.

=head1 LICENSE

GPLv3

=over

 spdxl  -- license identifier with reporting

 SPDX license identifier: GPL-3.0

 Copyright (C) 2015, Jeremiah C. Foster <jeremiah@jeremiahfoster.com>

 This file is part of spdxl.

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

 List of changes:
 Aug. 2015, spdxl.pl, created file

=back

=cut

## TODO -- the first issue we'll face is the high likelyhood of being
## in a git dir. Obviously we'll want to switch to a git handling
## module for that work or we'll just ignore it which is probably a
## really bad idea since important data can be gleaned or even
## determined with a high degree of certainty.

use Path::Tiny;
use File::Find;
use File::Compare;
use autodie;
use feature "say";
no warnings 'experimental::smartmatch';

my $git_dir = path("./.git/");
if (-e $git_dir) {
  # handle the git dir
};

my @directories_to_search = ".";
find(\&nogit, @directories_to_search);

my @files;
sub nogit {
  /^\.git.*\z/s && ($File::Find::prune = 1)
    ||
    push @files,  $File::Find::name;
}

# list of files names that match
my @licenses = map { $_ } grep /^\.\/(?:LICEN[CS]E|COPYING)$/, @files;
if (compare($licenses[0], $licenses[1]) == 0) {
  say "files identical.";
}
else {
  say "files not identical.";
  use Text::Diff;
  # magic
}
