#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>

#define BUF_SIZE 16

int main (int argc, char ** argv) {
     int fin, fout, n;
     char buf[BUF_SIZE];

     fin = open("in", O_RDONLY);
     fout = open("out", O_WRONLY | O_CREAT, S_IRUSR | S_IWUSR);

     while (( n = read ( fin, buf, BUF_SIZE -1 )) > 0) {
          write (fout, buf, n);
     }
     close (fin);
     close (fout);
     return 0;
}

