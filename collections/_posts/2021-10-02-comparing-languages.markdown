---
layout: post
title: "Comparing Languages"
date: 2021-10-02 14:53:31 -0400
tags: [c, java, python]
categories: [programming, scripting, languages, comparison]
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

{% github_sample_ref /TwoPizza9621536/snippets/blob/de58a106e186d7efe32b2cea868b87a226a96aa9/C/Printchara.c %}
{% highlight c linenos %}
{% github_sample /TwoPizza9621536/snippets/blob/de58a106e186d7efe32b2cea868b87a226a96aa9/C/Printchara.c 24 %}
{% endhighlight %}

## Java

With Java as the next language the are more things going on. Now there needs to
be modules for input/output (io), by using the
{% ihighlight java %}import{% endihighlight %} statments. There is also a
{% ihighlight java %}try{% endihighlight %} and
{% ihighlight java %}catch{% endihighlight %} block which catch excptions and
handle memory managment, this also is in C but only excptions becuase C does
not have managment.

{% github_sample_ref /TwoPizza9621536/snippets/blob/de58a106e186d7efe32b2cea868b87a226a96aa9/Java/Printchara.Java %}
{% highlight java linenos %}
{% github_sample /TwoPizza9621536/snippets/blob/de58a106e186d7efe32b2cea868b87a226a96aa9/Java/Printchara.Java 24 %}
{% endhighlight %}

## Python

Lastly Python has the simplist version of the program because it is also a
scripting language. This is the first version of the program
written. No imports or include as the python automatically includes the
python library which also include file handling. The
{% ihighlight python %}with{% endihighlight %} is the handler to close the
file, a memory managment handler like the
{% ihighlight java %}try{% endihighlight %} in java.

{% github_sample_ref /TwoPizza9621536/snippets/blob/de58a106e186d7efe32b2cea868b87a226a96aa9/Python/Printchara.py %}
{% highlight python linenos %}
{% github_sample /TwoPizza9621536/snippets/blob/de58a106e186d7efe32b2cea868b87a226a96aa9/Python/Printchara.py 24 %}
{% endhighlight %}

## Conclusion

C eventhough you have learn pointers, memory management and manually set
everything up, it is still simple. Java is both more complicated and simpified.
Python is the simplist as it is a beginner language and all of the io is
abstracted.

There are more version of the
[program written in different languagues]({{ page.snippets | absolute_url }}).
