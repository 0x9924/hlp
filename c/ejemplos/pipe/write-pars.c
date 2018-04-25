#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>

#define BUF_SIZE 16

int main (int argc, char ** argv) {
     int fin, fout, n;
     char buf[BUF_SIZE];
     char c;
     char * filein = 0, * fileout = 0;
     while ((c = getopt (argc, argv, "i:o:")) != -1)
          switch (c) {
          case 'i':
               filein = optarg;
               break;
          case 'o':
               fileout = optarg;
               break;
          case '?':
               fprintf (stderr,
                        "Caracter de opcion desconocido `\\x%x'.\n",
                        optopt);
               return 1;
          }

     if (!filein || !fileout) { puts("Falta nombre de archivo."); exit(0); }

     fin = open(filein, O_RDONLY);
     fout = open(fileout, O_WRONLY | O_CREAT, S_IRUSR | S_IWUSR);

     while (( n = read ( fin, buf, BUF_SIZE -1 )) > 0) {
          write (fout, buf, n);
     }
     close (fin);
     close (fout);
     return 0;
}

