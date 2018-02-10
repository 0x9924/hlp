#include <stdio.h>
#include <stdlib.h>

char * stdin_to_char ();

int main () {

     char * read_stdin = stdin_to_char();
     if (!read_stdin)
          fprintf(stderr, "error con malloc.\n");

     free(read_stdin);
     return 0;
}

char * stdin_to_char ()
{
     
     size_t allocated = 1024;
     char *result = (char *) malloc (allocated);
     if (result) {
          char *res_realloc;
          char *ult_char = result;

          size_t read_bytes;
          size_t bytes_to_read = allocated - 1;
          size_t readed = 0;
          while (1) {
               read_bytes = fread(ult_char, 1, bytes_to_read, stdin);
               
               if (read_bytes < bytes_to_read) {
                    if (feof(stdin)) {
                         break;
                    }
                    else {
                         free (result); return NULL;
                    }
               }
               readed += read_bytes;
               allocated += bytes_to_read;
               res_realloc = (char *) realloc (result, allocated);
               if (res_realloc == NULL) { free (result); return NULL; }
               ult_char = res_realloc + readed;
               result = res_realloc;
               
          }
          result[readed + read_bytes] = '\0';
     }
     return result;
}
