#include <stdio.h>
#include <stdlib.h>
#define _GNU_SOURCE
#include <string.h>

char *
stdin_to_char ();

int main(void)
{
     char * read_stdin = stdin_to_char();
     if (!read_stdin)
          fprintf(stderr, "error con malloc.\n");
     //puts(read_stdin);

     free (read_stdin);
     return 0;
}

char * stdin_to_char ()
{

     size_t allocated = 1000;
     char *result = (char *) malloc (allocated);

     if (result != NULL)  {
          char *res_realloc;
          char *ult_char;
          ult_char = result;

          char *line = (char *) malloc (100);
          size_t len = 0;
          ssize_t read;
          while ((read = getline(&line, &len, stdin)) != -1) {

               size_t len = strlen (line);

               /* Resize the allocated memory if necessary.  */
               if (ult_char + len + 1 > result + allocated)  {
                    allocated = (allocated + len) << 1;
                    res_realloc = (char *) realloc (result, allocated);
                    if (res_realloc == NULL) { free (result); return NULL; }
                    ult_char = res_realloc + (ult_char - result);
                    result = res_realloc;
               }

               //ult_char = mempcpy (ult_char, s, len);
               ult_char = memcpy (ult_char, line, len);
               ult_char += len;

          }
          free (line);

          /* Terminate the result string.  */
          *ult_char++ = '\0';

          /* Resize memory to the optimal size.  */
          res_realloc = realloc (result, ult_char - result);
          if (res_realloc != NULL)
               result = res_realloc;
     }

     return result;
}
