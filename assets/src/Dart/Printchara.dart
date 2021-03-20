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

// import modules if needed
import 'dart:core';
import 'dart:io';

// import 'package:print_chara/print_chara.dart' as print_chara;

// Entry point
void main() {
    // Ask how many A's should be written
    // and the name of the file
    // Dart is C and javascript like language.

    print("How many 'A' should be written to a file: ");
    var num = stdin.readLineSync();

    var newnum = int.parse(num!);
    assert(newnum is int);

    print('What is the name for the file: ');
    var filename = stdin.readLineSync();

    // Create a file and write to it then close it
    // The writing process is similar to Java/Kotlin
    var file = File(filename!);
    var stream = file.openWrite();
    for (var i = 0; i < newnum; i++) {
        stream.writeCharCode(65);
    }
    stream.close();

    // If previous operation completed then press any key to exit
    print('Complete. Press Enter to exit.');
    stdin.readLineSync();
}
