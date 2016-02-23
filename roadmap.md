# Roadmap 

SPDX-License-Identifier: CC-BY-4.0

This is the roadmap of spdxl. The current plan is to
recursively search directories looking for all files.

1. Do a recursive (one level) directory search if no file name is
given or if a directory name is given. The file or the directory flag
will be required. [Implemented]

2. spdxl will assemble a list of files, then compare them against a
known body of licenses and spdx tags to produce a database. This means
that spdxl will not only have to find the tag, but read it and
understand the name of the license attached. [TODO]

3. Output from the results of grepping the file list is presented as 
plain text on the command line. [TODO]



### Notes
Consider: "The license notice must be in some way “attached” to each
file. (Sec. 1.4.) In cases where putting it in the file is impossible
or impractical, that requirement can be fulfilled by putting the
notice somewhere that a recipient “would be likely to look for such a
notice,” such as a LICENSE file in the same directory as the
file. (Ex. A.) The license notice is as short as possible (3 lines) to
make it easy to put in as many different types of files as possible."
From:
http://lu.is/blog/2012/03/17/on-the-importance-of-per-file-license-information/

A tentative plan is to use URLs like this:
http://www.gnu.org/licenses/gpl-3.0.txt as a known-good copy of the
license. Yes, URLs change, but I imagine the FSF has planned to keep
theirs stable so I think its safe to rely on it. Not 100% certain
about this one: https://spdx.org/licenses/ but I'll need it anyway.

useful: https://spdx.org/licenses/
https://wiki.debian.org/UpstreamGuide#Licenses

Do we want to query Debian-sources to see if we can find our package and check the declared copyright file there for comparison?

 Create a database in this format?
filename | SHA256 sum | license guestimate
