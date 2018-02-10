#include <stdio.h>
#include <stdlib.h>

char * stdin_to_char ();

int main () {

     size_t block_size;
     size_t readed;
     char * read_stdin = stdin_to_char(&block_size, &readed);
     if (!read_stdin)
          fprintf(stderr, "error con malloc.\n");
     
     printf("allocated %lu bytes. Readed %lu bytes\n",
            block_size, readed);
     free(read_stdin);
     return 0;
}

char * stdin_to_char (size_t * block_size, size_t * bytes_readed)
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

               bytes_to_read <<= 1;
               
               readed += read_bytes;
               allocated += bytes_to_read;
               res_realloc = (char *) realloc (result, allocated);
               if (res_realloc == NULL) { free (result); return NULL; }
               ult_char = res_realloc + readed;
               result = res_realloc;
               
          }
          // hay q restar uno?
          *bytes_readed = readed + read_bytes;
          result[readed + read_bytes] = '\0';
     }

     *block_size = allocated;
     return result;
}
