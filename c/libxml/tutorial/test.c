#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <libxml/xmlmemory.h>
#include <libxml/parser.h>

void parseStory (xmlDocPtr doc, xmlNodePtr cur);


int main (int argc, char ** argv)
{
    puts("test de libxml");
    
    xmlDocPtr doc;
    xmlNodePtr cur;

    doc = xmlParseFile ("sample.xml");
    if (doc == NULL) { fprintf (stderr, "Un error al parsear docu.\n");	return 0; }

    cur = xmlDocGetRootElement (doc);

    if (cur == NULL) { fprintf (stderr, "documento vacio\n"); xmlFreeDoc (doc);	return 0; }

    if (xmlStrcmp (cur -> name, (const xmlChar *) "story")) {
	fprintf (stderr, "documentos del tipo incorrecto, root node != story");
	xmlFreeDoc (doc);
	return 0;
    }

    cur = cur -> xmlChildrenNode;
    while (cur != NULL) {
	if ((!xmlStrcmp (cur -> name, (const xmlChar *) "storyinfo"))) {
	    parseStory (doc, cur);
	}
	cur = cur -> next;
    }
}

void
parseStory (xmlDocPtr doc, xmlNodePtr cur) {
    xmlChar *key;
    cur = cur -> xmlChildrenNode;
    while (cur != NULL) {
      if ((!xmlStrcmp (cur -> name, (const xmlChar *) "keyword"))) {
	    key = xmlNodeListGetString (doc, cur -> xmlChildrenNode, 1);
	    printf ("keyword: %s\n", key);
	    xmlFree (key);
	}
	cur = cur -> next;
    }
    return;
}
