---
title: "The Quest For a MinGW GCC"
date: 2021-10-02 04:33:23 -0400
description: Compiling a compiler
---

> **MinGW® is a registered trademark of Software in the Pubic Interest Inc in
>  the United States.
> Windows® is a registered trademark of Microsoft Corporation in the United
>  States and other countries.
> Linux® is a registered trademark of Linus Torvalds in the United States
>  and other countries.

## Introduction

The [MinGW](https://osdn.net/projects/mingw/) project is a port the Gnu
Compiler Collection for Windows during XP. It was a native port enabling the
use of the Windows API. It got a fork called [MinGW-w64](https://mingw-w64.org)
which added 64bit support, provides a better port of the Windows API, and
allows Linux systems to compile to Windows.

I wanted a updated version of GCC running on the 
