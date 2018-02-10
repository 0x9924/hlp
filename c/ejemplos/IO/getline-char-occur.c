#include <stdio.h>
#include <ctype.h>
#include <stdlib.h>
#include <unistd.h>

void prhelp();

int main( int argc, char *argv[] )  
{
    int d = 0;
    int nline = 0;
    int solo_veces = 0;
    char c;
    char searched;
    while ((c = getopt (argc, argv, "hc:v")) != -1)
	switch (c)
	{
	case 'h':
	    prhelp();
	    return 0;
	case 'c':
	    searched = *optarg;
	    break;
	case 'v':
	    solo_veces = 1;
	    break;
	case '?':
	    if (isprint (optopt)) {
		fprintf (stderr, "Unknown option `-%c'.\n", optopt);
		prhelp();
	    }
	    else
		fprintf (stderr,
			 "Unknown option character `\\x%x'.\n",
			 optopt);
	    return 1;
	default:
	    abort ();
	
	}

    /*
    if(optind < argc )
    {    
	int index;
	for (index = optind; index < argc; index++)
	{
	    char * filename = argv[index];
	    FILE *fp  = fopen(filename, "r");
	    char *line = NULL;
	    size_t len = 0;
	    ssize_t read;
	    while ((read = getline(&line, &len, fp)) != -1) {
		if(nline > 0) printf("%d\t", nline++);
		printf("%s", line);
	    }
	    fclose(fp);
	}
    }
    else */
    {
	char *line = NULL;
	size_t len = 0;
	ssize_t read;
	int i, veces, total = 0;
	unsigned line_num = 0;
	while ((read = getline(&line, &len, stdin)) != -1) {
	    veces = 0; line_num++;
	    for (i = 0; i < len; i++)
		if (searched == line [i])
		    veces++;
	    total += veces;
	    if (!solo_veces)
		printf("%d:\t", line_num);
	    printf("%d\n", veces);
	}
	printf ("%d ocurrencias en total\n", total);

	free(line);
	exit(EXIT_SUCCESS);
    }
    
    return 0;
}

void prhelp()
{
    printf("\nUso:\n");
    printf("\tprog -c X\tlee de stdin\n"
	   "\tprog -vc X\tidem, pero sin decir el numero de linea");
}


