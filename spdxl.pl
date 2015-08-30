#!/usr/bin/perl

use warnings;
use strict;

=head1 NAME

spdxl.pm  -- script that attempts to identify FOSS licenses contained with files and directories.

=head1 VERSION

Version 0.1.0

=cut

our $VERSION = '0.1.0';

=head1 SYNOPSIS

This file is a script where many of the actions that spdxl executes are stored. 

=cut

## TODO -- the first issue we'll face is the high likelyhood of being
## in a git dir. Obviously we'll want to switch to a git handling
## module for that work or we'll just ignore it which is probably a
## really bad idea since important data can be gleaned or even
## determined with a high degree of certainty.


# Find an print any file we find recursively.
my @directories_to_search = ".";

use File::Find;
find(\&wanted, @directories_to_search);

sub wanted {
  print $_ . "\n";
}
