#define _GNU_SOURCE

#include <stdio.h>
#include <stdlib.h>
#include <dirent.h> 
#include <unistd.h>
#include <sys/stat.h>
#include <string.h>

int ls(char * dirpath) {

    DIR *d;
    if ( d = opendir (dirpath)) {
        struct dirent *dentry;
        while ((dentry = readdir(d)) != NULL) {
             puts(dentry -> d_name);
             
            /* if ( dentry -> d_type == DT_DIR ) { */
            /*     char * subdir; */
            /*     if (asprintf(&subdir, "%s/%s", dirpath, dentry -> d_name) < 0) { */
            /*         fprintf(stderr, "error: no hay memoria"); */
            /*         return 1; */
            /*     } */
            /*     DIR * sd; */
            /*     if (sd = opendir (subdir) ) { */
            /*         struct dirent *subdentry; */
            /*         while ((subdentry = readdir(sd)) != NULL) { */
            /*             if (0 == strncmp(sdirname, subdentry->d_name, */
            /*                              strlen(sdirname) + 1))  */
            /*                 puts(subdir); */
            /*         } */
            /*     } else { */
            /*         fprintf(stderr, "error: no pude abrir %s\n", subdir); */
            /*         return 1; */
            /*     } */
            /*     closedir(sd); */
            /*     free(subdir); */
            /* }  */
        }
        closedir(d);
    } else {
        fprintf(stderr, "error: no pude abrir %s\n", dirpath);
        return 1;
    }

    return 0;
}

int main () {
    return ls(get_current_dir_name());
}
