#define _GNU_SOURCE /* por get_current_dir_name */

#include <stdio.h>
#include <stdlib.h>
#include <dirent.h> 
#include <unistd.h>
#include <string.h>

     
struct arr {
    char ** nombres;
    int capacidad;
    int longitud;
};

struct arr * arr_nuevo () {
    struct arr * res = malloc(sizeof(struct arr));
    res -> nombres = malloc(sizeof(char*)*2);
    res -> capacidad = 2;
    res -> longitud = 0;
    return res;
}

void agregar(struct arr * a, char * nombre) {
    if (a -> longitud == a -> capacidad) {
        a -> nombres = realloc (a -> nombres, sizeof(char*) * a -> capacidad * 2);
        a -> capacidad *= 2;
    } 
    a -> nombres [a -> longitud] = strdup(nombre);
    a -> longitud++;
}

static int
cmpstringp (const void * s, const void * t) {
    return strcmp (* (char * const *) s, * (char * const *) t);
}


int ls(char * dirpath) {
    struct arr * narr = arr_nuevo();
    DIR *d;
    if ( d = opendir (dirpath)) {
        struct dirent *dentry;
        while ((dentry = readdir(d)) != NULL) {
             agregar(narr, dentry -> d_name);
        }
        closedir(d);
    } else {
        fprintf(stderr, "error: no pude abrir %s\n", dirpath);
        return 1;
    }

    qsort (narr -> nombres, narr -> longitud, sizeof(char*), cmpstringp);
    for (int i = 0; i < narr -> longitud; i++) 
        printf("%s\n", narr -> nombres [i]);
    return 0;
}

int main () {
    return ls(get_current_dir_name());
}
