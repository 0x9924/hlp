      program sum
      implicit none
      integer :: i, iarg, acum = 0
      character(len = 32) :: arg 
      
      i = 1
      do
         call get_command_argument(i, arg)

         if (len_trim(arg) == 0) exit
         read (arg, '(i32)' )  iarg
         acum = acum + iarg
         i = i + 1
      end do
      print *, acum
      end program sum
