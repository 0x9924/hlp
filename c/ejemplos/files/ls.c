#define _GNU_SOURCE

#include <stdio.h>
#include <stdlib.h>
#include <dirent.h> 
#include <unistd.h>
#include <sys/stat.h>
#include <string.h>
#include <sys/queue.h>
     
struct entry {
    char * nombre;
    LIST_ENTRY(entry) entries;
};
int ls(char * dirpath) {
    LIST_HEAD(listhead, entry) head = LIST_HEAD_INITIALIZER(head);
    
    DIR *d;
    if ( d = opendir (dirpath)) {
        struct dirent *dentry;
        while ((dentry = readdir(d)) != NULL) {
            struct entry * e = malloc(sizeof(struct entry));
            e -> nombre = strdup(dentry -> d_name);
            LIST_INSERT_HEAD(&head, e, entries);

            //puts(dentry -> d_name);
        }
        closedir(d);
    } else {
        fprintf(stderr, "error: no pude abrir %s\n", dirpath);
        return 1;
    }
    struct entry *tmp, * ent = LIST_FIRST(&head);
    while (ent) {
        puts(ent->nombre);
        tmp = LIST_NEXT(ent, entries);
        free(ent->nombre); free(ent);
        ent = tmp;
    }
    return 0;
}

int main () {
    return ls(get_current_dir_name());
}
