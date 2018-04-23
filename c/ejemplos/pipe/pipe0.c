#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>

int main(int argc, char **argv)
{
     char *cmd_ls[] = { "ls", "-al", NULL };
     char *cmd_wc[] = { "wc", "-l", NULL };
     pid_t ls, wc;
     int pfd[2];
     if (pipe(pfd) == -1) { perror("pipe"); exit(1); }
     
     if ( fork() == 0 ) {
          dup2(pfd[0],0);
          close(pfd[0]);
          close(pfd[1]);
          execvp (cmd_wc[0], cmd_wc);
          exit(0);
     } else /* if ( fork() == 0 ) */ { //wc
          dup2( pfd[1],1);
          close(pfd[0]);
          close(pfd[1]);
          execvp (cmd_ls[0], cmd_ls);
          exit(0);
     }
     close(pfd[0]);
     close(pfd[1]);
     return 0;
}
