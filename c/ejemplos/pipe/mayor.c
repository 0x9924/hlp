/*
 * Este programa:
 * $ ./prog -i FILEIN -o FILEOUT CMD [PARAM1 ...]
 * hace:
 * $ cat FILEIN | CMD > FILEOUT
 */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <ctype.h>
#include <sys/types.h>
#include <sys/stat.h>

#define BUF_SIZE 16

int main(int argc, char **argv)
{
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
               if (isprint (optopt)) 
                    fprintf (stderr, "Opcion desconocida `-%c'.\n", optopt);
               else
                    fprintf (stderr,
                             "Caracter de opcion desconocido `\\x%x'.\n",
                             optopt);
               return 1;
          }

     if (!filein || !fileout) { puts("Falta nombre de archivo."); exit(0); }

     char buf[BUF_SIZE];

     int fin, fout;

     if ((fin = open(filein, O_RDONLY)) == -1) {
          perror("No se pudo abrir archivo"); exit(1);
     }
     if ((fout = open(fileout, O_WRONLY | O_CREAT, S_IRUSR | S_IWUSR )
          == -1)) {
          perror("No se pudo abrir archivo"); exit(1);
     }

     int n ;
     while (( n = read( fin, buf, BUF_SIZE - 1) ) > 0) {
          write (fout, buf, n);
          buf[n] = '\0';
          //printf(buf);
     }
     close (fin); close(fout);
     return 0;
}


