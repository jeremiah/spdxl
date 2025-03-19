[![standard-readme compliant](https://img.shields.io/badge/readme%20style-standard-brightgreen.svg?style=flat-square)](https://github.com/RichardLitt/standard-readme)
![REUSE Compliance Check](https://github.com/jeremiah/spdxl/workflows/REUSE%20Compliance%20Check/badge.svg)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/jeremiah/spdxl/badge)](https://scorecard.dev/viewer/?uri=github.com/jeremiah/spdxl)
[![OpenSSF Best Practices](https://www.bestpractices.dev/projects/142/badge)](https://www.bestpractices.dev/projects/142)
# spdxl 

spdxl (pronounced spud-exel) is a tool that checks source 
code looking for a SPDX version 2.0 "tag" and produces a text-based output
on the command line. Designed to be used in conjunction with Debian's licensecheck
it provides a way to ensure that all the files are correctly licensed and that 
you can created a complete SPDX document. 

## Install

To install spdxl follow this incantation;
```
   perl Makefile.PL
   make
   sudo make install
```
The last command may require sudo to allow you to install software on your
system. This has been tested on a Debian GNU/Linux system but should work on most UNIX systems or OSes that have perl.

## Usage
The easiest way to use this is to call perl and spdxl.pl like this
```
perl spdxl.pl -d ./ -c
```
That uses the -d argument since spdxl needs a directory to read from (and the following "./" is the directory to read.) Then I've passed the -c flag to have colored output. The -c flag is optional. The -d flag is not. Call `perldoc spdxl` for more usage info.

## Bugs
Please use 'issues' on GitHub for spdxl.

## Contribute
Patches and pull requests are welcomed.

## See also 
[ninka](https://github.com/dmgerman/ninka)
[lint-bom](https://git.fsfe.org/reuse/bom-nodejs/src/master/src/lint-bom) 
[reuse](https://github.com/fsfe/reuse-tool) The reuse tool also has an action as well.

You can get tools that convert tags to spreadsheets here:
https://github.com/goneall/SPDX-Tools

* The image embedded in this page is being used as a SPEC: https://spdx.org/tools
* SPDX license data as JSON is here: http://spdx.org/licenses/licenses.json Might be fun to parse this and create a prettier HTML dump via Angular or similar.

## Copyright and License
Copyright (c) 2015 Jeremiah C. Foster

Source code licensed under the GPLv3
