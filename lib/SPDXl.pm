#!/usr/bin/perl -w

use strict;
package spdxl;

=head1 NAME

SPDXl.pm  -- perl library with subroutines for the spdxl.pl script

=head1 VERSION

Version 0.1.1

=cut

our $VERSION = '0.1.1';

=head1 SYNOPSIS

This file holds various subroutines that spdxl.pl reuses.

=cut

=head1 LICENSE

 SPDX-License-Identifier: GPL-3.0
 This file is part of the SPDXL package.

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





# # list of files names that match license or copyright as file names
# my @licenses = map { $_ } grep /^\.\/(?:LICEN[CS]E|COPYING)$/, @files;
# print "Files found\n";
# say map { "$_\n" } @files;
# # print "Potential licenses found\n";
# say map { "$_\n" } @licenses;


# my $license_database = path("./license_database/");
# opendir(D, "$license_database") || die "Can't open directory $license_database: $!\n";
# my @known_licenses = readdir(D);
# closedir(D);

# # compare each license found to those in our database
# if (compare($licenses[0], $licenses[1]) == 0) {
#   say "files identical.";
# }
# else {
#   say "files not identical.";
#   use Text::Diff;
#   # magic
# }



1;
