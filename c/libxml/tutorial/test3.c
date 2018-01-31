#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <libxml/xmlmemory.h>
#include <libxml/parser.h>
#include <ctype.h>

/* 
 * cmpilar con:
 * gcc $1 $(xml2-config --cflags --libs) 
/*

xmlNodePtr rootOfFile (char * filename);
void imprimir (xmlDocPtr doc, xmlNodePtr cur, unsigned n);
int whitespace (xmlChar * text);


int main (int argc, char ** argv)
{
    xmlDocPtr doc; xmlNodePtr cur;
    int i;
    for (i = 1; i < argc; i++) { 
	doc = xmlParseFile (argv[i]);
	if (doc == NULL) {
	    fprintf (stderr, "Un error al parsear docu.\n");
	    return 0;
	}
	cur = xmlDocGetRootElement (doc);
	imprimir (doc, cur, 0);
    }
}



void imprimir (xmlDocPtr doc, xmlNodePtr cur, unsigned n)
{
    
    if (cur) {
	if ((!xmlStrcmp (cur -> name, (const xmlChar *) "text"))) {
	    xmlChar *key;
	    key = xmlNodeListGetString (doc, cur, 1);
	    if (whitespace(key))
		printf ("%*s`%s'\n",n*4," ",  key);
	    xmlFree (key);
	    return;
	}

	printf( "%*s%s\n", n*4, " ", cur -> name);
	cur = cur -> xmlChildrenNode;
	
	while (cur != NULL) {
	    imprimir (doc, cur, n + 1);
	    cur = cur -> next;
	}
    }
}

int whitespace (xmlChar * text)
{
    while (isspace(*text))
	text++;
    return *text != '\0';
}
