---
title: Lightweight VSCode Setup For Beginners
categories:
  - Programming
  - Development
tags:
  - VSCode
---

Visual Studio Code (VSCode) is one of the popular most text editor due to its
extensions support, making it the swiss army knife of graphical text editors
that almost have the power of IDEs without being bloated or overkill for a small
project (NeoVim wins that one for terminal text editors). Due to VSCode being an
Electron app and installing a lot of extensions, VSCode can be very slow. But
there are ways to make it very lightweight, so here is how I setup VSCode.

<p class="message">
{% octicon info height:24 aria-label:Notice %} <strong>Note</strong>: VSCode
can be unresponsive when editing json files. When this happens, it's great sign
that you need to recreate your VSCode setup.
</p>

## Settings and Profiles

Once you have install VSCode and gotten familiar with the user environment, do
not install any extensions yet. Instead edit your default settings first as
[VSCode supports profiles in February 2023][1], this allow you to use your
default settings across different workflows without individually adding each
settings manually. Not to mention the main feature of profiles is using
activating extensions based on workflow, VSCode already does this but now you
can separate your extensions based on language like JavaScript, Python, Ruby,
etc.

*[IDEs]: Intergated Development Environments

[1]: https://code.visualstudio.com/updates/v1_76
