#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
#include <ctype.h>

int sum_ints_from_string (char *string);
void print_ints (char * string);

int main (int argc,char * argv[])
{
    if ( argc != 2 ) {
        puts("Uso: prog \"...\"");
        return 0;
    }
    char * input = argv [1];
    long long sum;
    sum = sum_ints_from_string ( input );

    printf ("Suma: %lld\n", sum);
    return 0;
}

void
print_ints (char *string)
{
  int sum = 0;

  while (1) {
    char *tail;
    int next;

    /* Skip whitespace by hand, to detect the end.  */
    while (isspace (*string)) string++;
    if (*string == 0)
      break;

    /* There is more nonwhitespace,  */
    /* so it ought to be another number.  */
    errno = 0;
    /* Parse it.  */
    next = strtol (string, &tail, 0);
    /* Add it in, if not overflow.  */
    if (errno) 
      printf ("Overflow\n");
    else
      sum += next;
    /* Advance past it.  */
    string = tail;
  }
}


int
sum_ints_from_string (char *string)
{
  int sum = 0;

  while (1) {
    char *tail;
    int next;

    /* Skip whitespace by hand, to detect the end.  */
    while (isspace (*string)) string++;
    if (*string == 0)
      break;

    /* There is more nonwhitespace,  */
    /* so it ought to be another number.  */
    errno = 0;
    /* Parse it.  */
    next = strtol (string, &tail, 0);
    /* Add it in, if not overflow.  */
    if (errno) 
      printf ("Overflow\n");
    else
      sum += next;
    /* Advance past it.  */
    string = tail;
  }

  return sum;
}
