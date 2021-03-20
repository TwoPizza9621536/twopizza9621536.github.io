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

// Kotlin is compatible with Java
// Import modules if needed
import java.io.File
import java.io.IOException
import java.io.RandomAccessFile
import java.nio.ByteBuffer
import java.nio.file.Paths

// Entry point
fun main() {
    // Unlike Java and like C#, Kotlin has it's own input method
    // Ask how many A's should be written
    // and the name of the file
    println("How many 'A' should be written to a file: ")
    val num = Integer.parseInt(readLine())

    println("What is the name for the file: ")
    val filename = readLine().toString()

    // Get directory and add the file name
    val currentDirName = System.getProperty("user.dir")
    val rootPath = Paths.get(currentDirName)
    val filePath = Paths.get(filename)
    val pathString = rootPath.resolve(filePath)

    // Create a file and write to it then close it
    val fs = File(pathString.toString())
    try(val stream = RandomAccessFile(fs, "rw")) {
        val channel = stream.channel
        val character = "A"
        for (i in 0 until num) {
            val strByte = character.toByteArray()
            val buffer = ByteBuffer.allocate(strByte.size)
            buffer.put(strByte)
            buffer.flip()
            channel.write(buffer)
        }
    } catch (e: IOException) {
        e.printStackTrace()
    }

    // If previous operation completed then press any key to exit
    println("Operation Complete. Press Enter to exit.")
    readLine()
}
