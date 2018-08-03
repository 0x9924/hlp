#define _GNU_SOURCE

#include <stdio.h>
#include <stdlib.h>
#include <dirent.h> 
#include <unistd.h>
#include <sys/stat.h>
#include <string.h>
#include <sys/queue.h>
     
struct nodo {
    char * nombre;
    struct nodo * next;
};

struct list {
     struct nodo * head;
};

void agregar(struct nodo ** ultimop, char * nombre) {
    struct nodo * tmp = malloc (sizeof(struct nodo));
    tmp -> nombre = strdup (nombre);
    tmp -> next = NULL;
    (*ultimop) -> next = tmp;
    *ultimop = tmp;
}

int ls(char * dirpath) {
    
    struct nodo lista = { .nombre = NULL, .next = NULL };
    struct nodo * ultimo = &lista;
    
    DIR *d;
    if ( d = opendir (dirpath)) {
        struct dirent *dentry;
        while ((dentry = readdir(d)) != NULL) {
             agregar(&ultimo, dentry -> d_name);
        }
        closedir(d);
    } else {
        fprintf(stderr, "error: no pude abrir %s\n", dirpath);
        return 1;
    }


    struct nodo *p = lista.next;
    for (; p != NULL; p = p -> next) {
        printf("%s\n", p -> nombre);
    }


    
    return 0;
}

int main () {
    return ls(get_current_dir_name());
}
