! Copyright (c) 2021 Sam W
!
! Permission is hereby granted, free of charge, to any person obtaining a copy of
! this software and associated documentation files (the "Software"), to deal in
! the Software without restriction, including without limitation the rights to
! use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
! the Software, and to permit persons to whom the Software is furnished to do so,
! subject to the following conditions:
!
! The above copyright notice and this permission notice shall be included in all
! copies or substantial portions of the Software.
!
! THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
! IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
! FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
! COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
! IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
! CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

! Entry Point
! This is similar to Pascal
program Printchara
    implicit none

    ! Declare variables
    INTEGER :: num
    INTEGER :: i
    CHARACTER(23) :: filename

    ! Ask how many 'A' should be written
    ! and the name of the file
    PRINT *, "How many 'A' should be written to a file: "
    READ(*,*) num

    PRINT *, "What is the name for the file: (Must be 20 characters excluding .txt): "
    READ(*,*) filename

    ! Create a file and write to it then close it
    OPEN(1, file = filename)
    do i = 0, num
        WRITE(1, "(A)", advance='no') 'A'
    end do
    CLOSE(1)

    ! If previous operation completed then press Enter to exit
    PRINT *, "Operation Complete. Press Enter to exit."
    READ(*,*)
end program Printchara
