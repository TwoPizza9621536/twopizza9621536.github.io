---
title: LFS For a 486
tags:
  - Linux
description: Linus is decapitating Linux on the 586, Long Live 486 Linux.
---

Last year I did [Linux From Scratch][1] as a way to learn how minimal Linux can
be, although I did not create a post. So here it is but I am going to compile
LFS for the 486, as might be the last version of Linux as Linus is removing
486 support.

---

## Old Script

With the upcoming Linux kernel version 6.0, Linus Torvalds express that he
wanted to remove 486 support from the kernel. Before that can happen, let's
celebrate with [Linux From Scratch][1] on a 586, also known as the Pentium, for
a 486.

### Setup

Before the build has even started, I wanted to use an emulated 486, but that was
way to slow to even boot Debian so now I am using an emulated 586. I do not have
486 or 586 that I can use. So [86Box][2] will be used as a replacement. Now
choosing the main distribution to build LFS, which is a pain on its own. The
first distribution I chose was Slackware, and it crashed in 86Box before
installing the base system, great. Then I used the latest Debian, which does not
support 486, I do not know why I even try that. After a ton of hoops, I install
Debian 7 on an emulated machine that supports booting from CD, which it failed.
So a 586 with Debian 11, nope. So Slackware on a 586 again, . Oh, also I need to
talk about the hardware I am going to use.

The hardware is the Celeron with 256MB RAM.
Installing the distributions are going to be slow as the emulated 486 are
running at the speed of 486 which are new 586 (I am using the fastest machine
that 86Box supports, a 586, with CD-Rom to install Debian and Slackware and it
is still a pain to install so GNOME Boxes is used instead). The setup has been
already done in November in two days so the build can start when I have time.

[1]: https://linuxfromscratch.org
[2]: https://86box.net
