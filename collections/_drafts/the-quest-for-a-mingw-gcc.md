---
title: "The Quest For a MinGW GCC"
date: 2021-10-02 04:33:23 -0400
description: Compiling a compiler
tag: [gcc]
categories: [compilers, compiling]
---

## Introduction

The [MinGW](https://osdn.net/projects/mingw/) project is a port the Gnu
Compiler Collection for Windows during XP. It was a native port enabling the
use of the Windows API. It got a fork called [MinGW-w64](https://mingw-w64.org)
which added 64bit support, provides a better port of the Windows API, and
allows Linux systems to compile to Windows.

I wanted a updated version of GCC running on for the MinGW triple, which is
`mingw`. A triple is basically the a way to tell the compiler to compile the
code for a specific platfrom. The [OSDev Wiki][1] explains [targing triple][2]
better, and a great resource for general OS development and programming.

I wanted a updated version of GCC running on the `mingw` triple. The current
version is GCC 11 (at the time of writing this)

[1]: <https://wiki.osdev.org>
[2]: <https://wiki.osdev.org/Target_Triplet>
