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
     char * filename = 0;
     while ((c = getopt (argc, argv, "f:")) != -1)
          switch (c) {
          case 'f':
               filename = optarg;
               break;
          case '?':
               if (isprint (optopt)) 
                    fprintf (stderr, "Opcion desconocida `-%c'.\n", optopt);
               else
                    fprintf (stderr,
                             "Caracter de opcion desconocido `\\x%x'.\n",
                             optopt);
               return 1;
          /* default: */
          /*      puts("Falta nombre de archivo."); */
          /*      exit(0); */
          }
     if (filename == 0) {
          puts("Falta nombre de archivo."); exit(0);
     }

     FILE *fpin;
     char buf[BUF_SIZE];
     int pfd[2];
     //pid_t ls, wc;
     
     if ((fpin = fopen(filename, "r")) == 0) {
          perror("No se pudo abrir archivo."); exit(1);
     }
     if (argc == optind) {
          puts("Falta comando."); exit(1);
     }

     if (pipe(pfd) == -1) { perror("pipe"); exit(1); } 

     if (fork() == 0) { // es child
          dup2 (pfd[0], 0);
          dup2 (pfd[1], 1);
          execvp(argv[optind], argv + optind);
          close (pfd[0]);
          close (pfd[1]);
     } else { // es el padre
          close(pfd[0]);
          while (read(pfd[0], buf, BUF_SIZE) < 0) {
               puts("");
               for (int i = 0; i < BUF_SIZE; i++)
                    printf("%c", buf[i]);
          }
          
          close(pfd[1]);
     }

}
