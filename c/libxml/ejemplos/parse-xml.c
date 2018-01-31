#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <libxml/xmlmemory.h>
#include <libxml/HTMLparser.h>
#include <ctype.h>

/* 
 * cmpilar con:
 * gcc $1 $(xml2-config --cflags --libs) 
*/

xmlNodePtr rootOfFile (char * filename);
void imprimir (xmlNodePtr cur, unsigned n);
int whitespace (xmlChar * text);
const unsigned indentation = 4;

int main (int argc, char ** argv)
{
    xmlDocPtr doc; xmlNodePtr cur;
    int i;
    int parse_ops = HTML_PARSE_NOBLANKS
      | HTML_PARSE_NOERROR | HTML_PARSE_NOWARNING
      | HTML_PARSE_NONET;

    for (i = 1; i < argc; i++) { 
      doc = htmlReadFile (argv[i], NULL, parse_ops);
                          
	if (doc == NULL) {
	    fprintf (stderr, "Un error al parsear documento.\n");
	    return 0;
	}
	cur = xmlDocGetRootElement (doc);
	imprimir (cur, 0);
    }
}



void imprimir (xmlNodePtr cur, unsigned n)
{
    while (cur) {
        if ( cur -> type == XML_ELEMENT_NODE) {
            printf("%*s%s\n", n * indentation, " ", cur -> name);
        } else if  ( cur -> type == XML_TEXT_NODE) {
            char * content = cur -> content;
            if (!whitespace(content))
                printf("%*s%s\n", n * indentation, " ",  content);
	}

        xmlAttr* attr = cur->properties;
        while(attr)
        {
            xmlChar* value =
                xmlNodeListGetString (cur -> doc, attr -> children,1);
            printf("%*s%s = \"%s\"\n",
                   n * indentation + indentation/2, " ",
                   attr -> name,
                   (char *) value);
            xmlFree(value);
            attr = attr -> next;
        }
        imprimir (cur -> children, n + 1);
        cur = cur -> next;
    }
}

int whitespace (xmlChar * text)
{
    while (isspace(*text))
	text++;
    return *text == '\0';
}
