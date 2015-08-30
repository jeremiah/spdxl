This is the roadmap of spdxl. Since the code is at version 0.0.0, the
first step is to try and specify an algorithm. The plan is to
recursively search directories looking for all files.

1. Do a recursive (one level) directory search if no file name is
given or if a directory name is given. The file or the directory flag
will be required.

spdxl will assemble a list of those files, then compare them against a
known body of licenses and spdx tags to produce a database.

2. Create a database in this format;

filename | SHA256 sum | license guestimate

Since one of the targets of spdxl is Debian, Debian's license policies
will be followed as a guide for the algorithm. For more info see the
DFSG and https://wiki.debian.org/UpstreamGuide#Licenses

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