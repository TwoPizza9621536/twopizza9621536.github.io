---
layout: post
title: "Comparing Languages"
date: 2021-10-02 14:53:31 -0400
tags:
  - C
  - Java
  - Python
categories:
  - Scripting
  - Programming
  - Languages
  - Comparison
toc: true
snippets: /snippets/2021/01/21/type-number-of-characters-into-a-file
---

This is a comparison of syntax in 3 different languages as well as a test. It
is just a simple comparison. To compare them I written a program that asks a
number to write the character 'A' into a file that is also going to be provided
by the user.

## C

C looks like it is difficult to comprehend but is it simple. First define the C
standard in and out headers for input and output and the C standard library
headers for file handling. The main function starts with initialization of an
integer and a character array, to store the inputs. Then ask the user with
stdin and stdout using {% ihighlight c %}prinf(){% endihighlight %} and
{% ihighlight c %}scanf(){% endihighlight %}. Next create a file pointer `*` to
the filename provided to create, open and write to the file. Last close it and
ask the user input to exit.

{% highlight c linenos %}
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv)
{
    int num = 0;
    char filename[24];

    printf("How many 'A' should be written to a file: \n");
    scanf("%d", &num);

    printf("What is the name for the file: (Must be 24 characters): \n");
    scanf("%24s", filename);

    FILE *fptr;

    fptr = fopen(filename, "w");

    for (size_t i = 0; i < num; i++)
    {
        fprintf(fptr, "%c", 'A');
    }

    fclose(fptr);

    printf("Operation Completed. Press Enter to exit.\n");
    fflush(stdout);
    int chara;
    while ((chara != '\n') && (chara != EOF) )
    {
        chara = getchar();
    }

    return 0;
}
{% endhighlight %}

## Java

With Java as the next language the are more things going on. Now there needs to
be modules for input/output (io), by using the
{% ihighlight java %}import{% endihighlight %} statments. There is also a
{% ihighlight java %}try{% endihighlight %} and
{% ihighlight java %}catch{% endihighlight %} block which catch excptions and
handle memory managment, this also is in C but only excptions becuase C does
not have managment.

{% highlight java linenos %}
package io.Printchara;

import java.io.*;
import java.nio.file.*;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.util.Scanner;

public class Main
{
    public static void main(String[] args)
    {
        Scanner input = new Scanner(System.in);

        logger.log("How many 'A' should be written to a file: ");
        int num = Integer.parseInt(input.nextLine());

        logger.log("What is the name for the file: ");
        String filename = input.nextLine();

        writeChara(Paths.get(System.getProperty("user.dir"), filename));

        logger.log("Operation Complete. Press Enter to exit.");
        input.nextLine();
        input.close();
    }

    public static void writeChara(filePath)
    {
        File fs = new File(String.valueOf(filePath));
        try(RandomAccessFile stream = new RandomAccessFile(fs, "rw"))
        {
            FileChannel channel = stream.getChannel();
            String character = "A";

            for (int i = 0; i < num; i++)
            {
                byte[] strByte = character.getBytes();
                ByteBuffer buffer = ByteBuffer.allocate(strByte.length);

                buffer.put(strByte);
                buffer.flip();
                channel.write(buffer);
            }
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
    }        
}
{% endhighlight %}

## Python

Lastly Python has the simplist version of the program because it is also a
scripting language. This is the first version of the program
written. No imports or include as the python automatically includes the
python library which also include file handling. The
{% ihighlight python %}with{% endihighlight %} is the handler to close the
file, a memory managment handler like the
{% ihighlight java %}try{% endihighlight %} in java.

{% highlight python linenos %}
print("How many 'A' should be written to a file: ")
num = input()

print("What is the name for the file: ")
filename = input()

with open(filename, 'w+') as f:
    for i in range (int(num)):
        f.write('A')
        i = i + 1

input("Operation Completed. Press Enter to exit.")
{% endhighlight %}

## Conclusion

C eventhough you have learn pointers, memory management and manually set
everything up, it is still simple. Java is both more complicated and simpified.
Python is the simplist as it is a beginner language and all of the io is
abstracted.

There are more version of the
[program written in different languagues]({{ post.snippets | relative_url }}).
