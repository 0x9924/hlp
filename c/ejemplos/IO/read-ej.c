#include <unistd.h>
#include <stdio.h>

int main() {
     char ch;
     while (read(STDIN_FILENO, &ch, 1 ) > 0) {
          printf("%c", ch);
     }
     return 0;
}
