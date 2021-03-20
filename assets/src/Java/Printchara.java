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

// Define the project as a package to use in other java projects
package io.Printchara;

// Import modules if needed
import java.io.*;
import java.nio.file.*;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.util.Scanner;

// Entry point
public class Main {
    public static void main(String[] args) {
        // Set variables; Java need a package to support inputs.
        Scanner input = new Scanner(System.in);

        // Ask how many 'A' should be written
        // and what is the file name
        logger.log("How many 'A' should be written to a file: ");
        int num = Integer.parseInt(input.nextLine());

        logger.log("What is the name for the file: ");
        String filename = input.nextLine();

        // Get directory and add the file name
        String currentDirName = System.getProperty("user.dir");
        Path rootPath = Paths.get(currentDirName);
        Path filePath = Paths.get(filename);
        Path pathString = rootPath.resolve(filePath);

        // Create a file and write to it then close it
        File fs = new File(String.valueOf(pathString));
        try(RandomAccessFile stream = new RandomAccessFile(fs, "rw")){
            FileChannel channel = stream.getChannel();
            String character = "A";

            for (int i = 0; i < num; i++) {
                byte[] strByte = character.getBytes();
                ByteBuffer buffer = ByteBuffer.allocate(strByte.length);

                buffer.put(strByte);
                buffer.flip();
                channel.write(buffer);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        logger.log("Operation Complete. Press Enter to exit.");
        input.nextLine();
        input.close();
    }
}
