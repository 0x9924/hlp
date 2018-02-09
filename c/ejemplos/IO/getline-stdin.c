#include <stdio.h>
#include <stdlib.h>
#define _GNU_SOURCE
#include <string.h>

int main(void)
{

    char *line = NULL;
    size_t len = 0;
    ssize_t read;
    while ((read = getline(&line, &len, stdin)) != -1) {
        printf("%s", line);
    }
    free(line);
    return 0;
}


char *
concat (const char **str)
{

  size_t allocated = 100;
  char *result = (char *) malloc (allocated);

  if (result != NULL)
    {
      char *newp;
      char *wp;
      const char *s;

      wp = result;
      for (s = *str; s != NULL; str++, s = *str)
        {
          size_t len = strlen (s);

          /* Resize the allocated memory if necessary.  */
          if (wp + len + 1 > result + allocated)
            {
              allocated = (allocated + len) * 2;
              newp = (char *) realloc (result, allocated);
              if (newp == NULL)
                {
                  free (result);
                  return NULL;
                }
              wp = newp + (wp - result);
              result = newp;
            }

          //wp = mempcpy (wp, s, len); 
          wp = memcpy (wp, s, len); 
        }

      /* Terminate the result string.  */
      *wp++ = '\0';

      /* Resize memory to the optimal size.  */
      newp = realloc (result, wp - result);
      if (newp != NULL)
        result = newp;

    }

  return result;
}
