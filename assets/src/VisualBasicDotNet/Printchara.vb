' Copyright (c) 2021 Sam W
'
' Permission is hereby granted, free of charge, to any person obtaining a copy of
' this software and associated documentation files (the "Software"), to deal in
' the Software without restriction, including without limitation the rights to
' use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
' the Software, and to permit persons to whom the Software is furnished to do so,
' subject to the following conditions:
'
' The above copyright notice and this permission notice shall be included in all
' copies or substantial portions of the Software.
'
' THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
' IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
' FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
' COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
' IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
' CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

' Define any namespace
Imports System
Imports System.IO

''' <summery>
''' Visual Basic .Net is almost compatible with C#.
''' The syntax is Visual Basic 6.0 but all of the
''' functions are from the .Net framework.
''' Entry Point similar to Pascal and Fortran
''' </summery>

' Entry Point
Module Printchara
    Sub Main()
        ' Ask how many 'A' should be written
        ' and the name of the file
        Console.WriteLine("How many 'A' should be written to a file: ")
        Dim num As String = Console.ReadLine()

        ' Set variables
        Dim newnum As Integer = 0

        ' Fast Parsing without quiting
        While Not Integer.TryParse(num, newnum)
            Console.WriteLine("Please enter a positive number: ")
            num = Console.ReadLine()
        End While

        Console.WriteLine("What is the name for the file: ")
        Dim filename As String = Console.ReadLine()

        ' Get directory and add the file name
        Dim currentDirName As String = Directory.GetCurrentDirectory()
        Dim pathString As String = Path.Combine(currentDirName, filename)

        ' Create a file and write to it then close it
        Using fs As Filestream = File.Create(pathString)
            For i As Integer = 0 To newnum
                fs.WriteByte(Convert.ToByte("A"))
            Next i
        End Using

        ' If previous operation completed then press any key to exit
        Console.WriteLine("Operation Complete. Press any key to exit.")
        Console.ReadKey()
    End Sub
End Module
