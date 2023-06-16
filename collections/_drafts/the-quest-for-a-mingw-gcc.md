---
title: The Quest For a MinGW GCC
date: 2023-06-15 04:33:23 -0400
description: Compiling a compiler
tags:
  - CompileHell
  - Software
slug: quest-mingw-gcc
---

## Introduction

> Note: This article was original drafted in 2021.

The [MinGW](https://osdn.net/projects/mingw/) project is a port the Gnu
Compiler Collection for Windows during XP. It was a native port enabling the
use of the Windows API. It got a fork called [MinGW-w64](https://mingw-w64.org)
which added 64bit support, provides a better port of the Windows API, and
allows Linux systems to compile to Windows.

I wanted a updated version of GCC running on for the MinGW triple, which is
`mingw` (2023 update: or `mingw32`). A triple is basically the a way to tell the
compiler to compile the code for a specific platform. The [OSDev Wiki][1]
explains [targeting triple][2] better, and a great resource for general OS
development and programming.

I wanted a updated version of GCC running on the `mingw` (or `mingw32`) triple.
The current version is GCC 11 (at the time of writing this) so this will be my
target (2023 update: I am targeting GCC 10 to rebuild this project).

## Setup

So I downloaded MinGW and selected the meta environments for development, a
basic MinGW environment, additional development libraries and GCC (and binutils
for newer versions of GCC). Then using MSYS2 environment to download
prerequisites as the MSYS environment does not include `sha512sum`. Next
configure GCC with the following command:

{% highlight sh %}
../gcc-10.4.0/configure --prefix=mingw32 --disable-nls --enable-languages=c
{% endhighlight %}

Then the `make` command to start the compilation, this will take a lot of hours,
so you will be here for a while.

[1]: https://wiki.osdev.org
[2]: https://wiki.osdev.org/Target_Triplet
