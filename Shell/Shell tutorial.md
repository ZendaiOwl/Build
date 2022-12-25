# 1. Introduction
Purpose Of This Tutorial

This tutorial is written to help people understand some of the basics of shell script programming (aka shell scripting), and hopefully to introduce some of the possibilities of simple but powerful programming available under the Bourne shell. As such, it has been written as a basis for one-on-one or group tutorials and exercises, and as a reference for subsequent use.

Getting The Most Recent Version Of This Tutorial

You are reading Version 4.2, last updated 2nd March 2021.

The most recent version of this tutorial is always available at: https://www.shellscript.sh. Always check there for the latest copy. (If you are reading this at some different address, it is probably a copy of the real site, and therefore may be out of date).

A Brief History of sh

Steve Bourne wrote the Bourne shell which appeared in the Seventh Edition Bell Labs Research version of Unix.
Many other shells have been written; this particular tutorial concentrates on the Bourne and the Bourne Again shells.
Other shells include the Korn Shell (ksh), the C Shell (csh), and variations such as tcsh.
This tutorial does not cover those shells.
Audience
This tutorial assumes some prior experience; namely:

Use of an interactive Unix/Linux shell
Minimal programming knowledge - use of variables, functions, is useful background knowledge
Understanding of some Unix/Linux commands, and competence in using some of the more common ones. (ls, cp, echo, etc)
Programmers of ruby, perl, python, C, Pascal, or any programming language (even BASIC) who can maybe read shell scripts, but don't feel they understand exactly how they work.
You may want to review some of the feedback that this tutorial has received to see how useful you might find it.

Typographical Conventions Used in This Tutorial
Significant words will be written in italics when mentioned for the first time.

Code segments and script output will be displayed as monospaced text.
Command-line entries will be preceded by the Dollar sign ($). If your prompt is different, enter the command:

PS1="$ " ; export PS1
Then your interactions should match the examples given (such as ./my-script.sh below).
Script output (such as "Hello World" below) is displayed at the start of the line.

$ echo '#!/bin/sh' > my-script.sh
$ echo 'echo Hello World' >> my-script.sh
$ chmod 755 my-script.sh
$ ./my-script.sh
Hello World
$Entire scripts will be shown with a gray background, and include a reference to the plain text of the script, where available:
my-script.sh
#!/bin/sh
# This is a comment!
echo Hello World	# This is a comment, too!
Note that to make a file executable, you must set the eXecutable bit, and for a shell script, the Readable bit must also be set:
$ chmod a+rx my-script.sh
$ ./my-script.sh