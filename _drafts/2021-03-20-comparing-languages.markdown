---
layout: post
title: "Comparing Languages"
date: 2021-03-20 12:06:00 -0500
---

This is a comparison of different languages. The first one is C.

{% highlight c %}
// Define any preprocessor header files
#include <stdio.h>
#include <stdlib.h>
#include <conio.h>

// Entry Point
int main(int argc, char **argv)
{
    // Set variables
    int num = 0;
    char filename[23];

    // Ask how many A's should be written
    // and the name of the file
    printf("How many 'A' should be written to a file: \n");
    scanf("%d", &num);

    printf("What is the name for the file: (Must be 20 characters excluding .txt): \n");
    scanf("%s", filename);

    // Create a file and write to it then close it
    FILE *fptr;

    fptr = fopen(filename, "w");

    for (size_t i = 0; i < num; i++)
    {
        fprintf(fptr, "%c", 'A');
    }

    fclose(fptr);

    // If previous operation completed then press any key to exit
    printf("Operation Completed. Press any to exit.\n");
    getchar();

    return 0;
}
{% endhighlight %}
