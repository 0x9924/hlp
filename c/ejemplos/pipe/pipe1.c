/*
 * Este programa:
 * $ ./prog -i FILEIN -o FILEOUT CMD [PARAM1 ...]
 * hace:
 * $ cat FILEIN | CMD | FILEOUT
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
     int pfd[2];
     int fin, fout;
     if (argc == optind) { puts("Falta comando."); exit(1); }
     if (pipe(pfd) == -1) { perror("pipe"); exit(1); } 
     if ( fork() ) { // es padre
          if ((fout = open(fileout, O_WRONLY | O_CREAT, S_IRUSR | S_IWUSR ))
              == -1) {
               perror("No se pudo abrir archivo"); exit(1);
          }
          close (pfd[1]);
          dup2 (pfd[0], 0);
          int n ;
          while ( (n = read(0, buf, BUF_SIZE - 1) ) > 0) {
               write (fout, buf, n);
               buf[n] = '\0';
               printf(buf);
          }
          close (pfd[0]);
     } else { // es el hijo
          if ((fin = open(filein, O_RDONLY)) == -1) {
               perror("No se pudo abrir archivo"); exit(1);
          }
          close (pfd[0]);
          dup2 (fin, 0);
          dup2 (pfd[1], 1);
          execvp(argv[optind], argv + optind);
          close (pfd[1]);
          close (fin);
          exit(0);
     }
}
