#!/usr/bin/perl

use warnings;
use strict;

=head1 NAME

SPDXl.pm  -- perl library with subroutines for the spdxl.pl script

=head1 VERSION

Version 0.1.0

=cut

our $VERSION = '0.1.0';

=head1 SYNOPSIS

This file holds various subroutines that spdxl.pl reuses.

=cut

sub execfind {
  # Find an print any file we find recursively.
  my @directories_to_search = ".";

  use File::Find;
  find(\&wanted, @directories_to_search);

  sub wanted {
    /^\.git.*\z/s  # skip git dirs
      && ($File::Find::prune = 1)
      ||
      print $File::Find::name . "\n";
  }
}








