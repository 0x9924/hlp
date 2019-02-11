#include <dirent.h>
#include <stdio.h>

// File Types:
char *file_type[] = {
    "DT_UNKNOWN", "DT_REG", "DT_DIR", "DT_FIFO",
    "DT_SOCK", "DT_CHR", "DT_BLK", "DT_LNK"
};
// DT_UNKNOWN: The type is unknown. Only some filesystems have full support to return the type of the file, others might always return this value.
// DT_REG: A regular file.
// DT_DIR: A directory.
// DT_FIFO: A named pipe, or FIFO. See FIFO Special Files.
// DT_SOCK: A local-domain socket.
// DT_CHR: A character device.
// DT_BLK: A block device.
// DT_LNK: A symbolic link. 
/**
struct dirent {
    ino_t          d_ino;       // Inode number 
    off_t          d_off;       // Not an offset; see below 
    unsigned short d_reclen;    // Length of this record 
    unsigned char  d_type;      // Type of file; not supported
                                //   by all filesystem types 
    char           d_name[256]; // Null-terminated filename 
};
**/

void dir_content(char * dirname)
{
    DIR *d;
    if ( d = opendir (dirname) ) {
        struct dirent *dentry;


        while ((dentry = readdir(d)) != NULL) {
            printf ("%x\t%s\t%s\n", dentry->d_type, file_type[dentry->d_type], dentry->d_name);
        }


    } else {
        printf("error: no pude abrir %s\n", dirname);
    }

}

void print_types () {
    printf("%s\t%x\n", "DT_UNKNOWN", DT_UNKNOWN);
    printf("%s\t%x\n", "DT_REG", DT_REG);
    printf("%s\t%x\n", "DT_DIR", DT_DIR);
    printf("%s\t%x\n", "DT_FIFO", DT_FIFO);
    printf("%s\t%x\n", "DT_SOCK", DT_SOCK);
    printf("%s\t%x\n", "DT_CHR", DT_CHR);
    printf("%s\t%x\n", "DT_BLK", DT_BLK);
    printf("%s\t%x\n", "DT_LNK", DT_LNK);

}


int main (int argc, char ** argv) {
    for (int i = 0; i < 8; i++) {
        printf("i: %d\t%s\n",i, file_type[i]);
    }

    for (int i = 1; i < argc; i++) {
        dir_content(argv[i]);
    }

    print_types();
}


