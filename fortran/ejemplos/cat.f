      program sum
      implicit none
      integer :: i
      character(len = 32) :: filename
      character :: buffer
      i = 1
      do
         call get_command_argument(i, filename)
         if (len_trim(filename) == 0) exit
         i = i + 1
         open (unit = 1, file = filename)
         read (1, *) buffer
         print *, buffer
         close (1)
      end do

      end program sum
