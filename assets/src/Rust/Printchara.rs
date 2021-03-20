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

// import namespace of needed
use std::io;
use std::path::Path;
use std::fs::File;
use std::io::Write;

// Entry point
fn main() {
    // set variables
    let mut num = String::new();
    let mut filename = String::new();
    let mut void = String::new();

    // Ask how many A's should be written
    // and the name of the file
    println!("How many 'A' should be written to a file: ");
    io::stdin()
        .read_line(&mut num)
        .expect("Failed to read line");
    let num: u32 = num.trim().parse().expect("Failed to parse string");

    println!("What is the name for the file: ");
    io::stdin()
        .read_line(&mut filename)
        .expect("Failed to read line");

    let file_path: String = filename.trim().to_string();

    // Create a file and write to it then close
    writefile(file_path, num).expect("Failed to write file");

    // If previous operation completed then press any key to exit
    println!("Operation Completed. Press Enter to exit.");
    io::stdin()
        .read_line(&mut void)
        .expect("Failed to read line");
}

// Have a another function to handle exceptions
fn writefile(filename: String, num: u32) -> std::io::Result<()> {
    // Get directory and add the file name
    let full_path = Path::new(&filename);
    let mut file = File::create(&full_path)?;

    let mut counter = 0;
    while counter < num {
        file.write("A".as_bytes())?;
        counter += 1;
    }
    return Ok(());
}
