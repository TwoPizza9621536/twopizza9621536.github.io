/**
 * Copyright (c) 2021 Sam W
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of
 * this software and associated documentation files (the "Software"), to deal in
 * the Software without restriction, including without limitation the rights to
 * use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
 * the Software, and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 * FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 * COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
 * IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */


// Define any namespace
using System;
using System.IO;

// In CS9 you can write in the Top-level
// below is the entry point

// C# is a Java like language that is closer to Kotlin.

/**
 * namespace program
 * {
 *     public class myclass
 *     {
 *         static void main()
 *         {
 *              Function();
 *         }
 *     }
 * }
 */

// Ask how many 'A' should be written
// and the name of the file

Console.WriteLine("How many 'A' should be written to a file: ");
string num = Console.ReadLine();

// set variables
int newnum = 0;

// Fast Parsing without quiting
while (!int.TryParse(num, out newnum))
{
    Console.WriteLine("Please enter a positive number: ");
    num = Console.ReadLine();
}

Console.WriteLine("What is the name for the file: ");
string filename = Console.ReadLine();

// Get directory and add the file name
string currentDirName = Directory.GetCurrentDirectory();
string pathString = Path.Combine(currentDirName, filename);

// Create a file and write to it then close it
using (FileStream fs = File.Create(pathString))
{
    for (int i = 0; i < newnum; i++)
    {
        fs.WriteByte((byte)'A');
    }
}

// If previous operation completed then press any key to exit
Console.WriteLine("Operation Complete. Press any key to exit.");
Console.ReadKey();
