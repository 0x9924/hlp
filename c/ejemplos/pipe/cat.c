#include <stdlib.h>
#include<stdio.h>
#include<fcntl.h>
#include<unistd.h>
#include<sys/stat.h>
#include<sys/types.h>


#define BUF_SIZE 64
int main(int argc,char *argv[])
{
     int fd = 0, n;
     char buf[BUF_SIZE];
     struct stat s;
     if(argc!=2) { printf("./prog archivo");  exit(1); }

     if ((fd = open (argv[1], O_RDONLY)) == -1) {
          perror("error leyendo archivo");
     }
     
     while( (n = read (fd, buf, BUF_SIZE)) > 0 )
          write (1, buf, n);
}
