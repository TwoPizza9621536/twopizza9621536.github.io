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

// Define any preprocessor header files
#include <iostream>
#include <fstream>
#include <string>

/**
 * define the standard library unless you name
 * your function after std functions or
 * using namespace std is confusing with other
 * functions.
 * I recommend not using 'using namespace std;'
 */

using namespace std;

// Entry point
int main(int argc, char **argv)
{
// Set variables
    int num = 0;
    string filename;

    // Ask how many A's should be written
    // and the name of the file
    cout << "How many 'A' should be written to a file: " << endl;
    cin >> num;

    cout << "What is the name for the file: " << endl;
    cin >> filename;

    // Create a file and write to it then close it
    ofstream file;

    file.open(filename);

    for (int i = 0; i < num; i++)
    {
        file << 'A';
    }

    file.close();

    // If previous operation completed then press any key to exit
    cout << "Operation Completed. Press Enter to exit.";
    cin.get();
    cin.ignore();

    return 0;
}
