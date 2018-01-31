/* compile with:
** gcc -D_GNU_SOURCE google-fin.c -lcurl
*/
#include <stdio.h>
#include <ctype.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <curl/curl.h>

#define MARKET_BUFF 32

/* http://www.google.com/finance/info?infotype=infoquoteall&q=NASDAQ:AAPL */

char url[] = "http://www.google.com/finance/info";

struct MemoryStruct {
    char *memory;
    size_t size;
};

void print_fin_data(char * url);
static size_t
WriteMemoryCallback(void *contents, size_t size, size_t nmemb, void *userp);


int main(int argc, char *argv[]) 
{
    char market [MARKET_BUFF] = "BCBA";
    char c;
    
    while ((c = getopt (argc, argv, "m:")) != -1)
        switch (c)
        {
        case 'm':
            if (strlen(optarg) >= MARKET_BUFF) { 
                puts("market incorrecto.");
                return 0;
            }
            strcpy(market, optarg);
            break;
        case '?':
            if (isprint (optopt))
                fprintf (stderr, "Opcion desconocida `-%c'.\n", optopt);
            else
                fprintf (stderr,
                         "Caracter de opcion desconocido `\\x%x'.\n",
                         optopt);
            return 1;
        default:
            abort ();
        }


    if (optind == argc) { puts("Ingrese un ticker."); return 0; }
    
    char * query;

    asprintf(&query, "%s?infotype=infoquoteall&q=%s:%s",
             url, market, argv[optind]);
    print_fin_data(query);
    return 0;
}

void print_fin_data(char * url)
{
    CURL *curl_handle;
    CURLcode res;
  
    struct MemoryStruct chunk;

    chunk.memory = malloc(1);  /* will be grown as needed by the realloc above */
    chunk.size = 0;    /* no data at this point */

    curl_global_init(CURL_GLOBAL_ALL);

    curl_handle = curl_easy_init();
    curl_easy_setopt(curl_handle, CURLOPT_URL, url);
    curl_easy_setopt(curl_handle, CURLOPT_WRITEFUNCTION, WriteMemoryCallback);
    curl_easy_setopt(curl_handle, CURLOPT_WRITEDATA, (void *)&chunk);
    curl_easy_setopt(curl_handle, CURLOPT_USERAGENT, "libcurl-agent/1.0");
    res = curl_easy_perform(curl_handle);

    if(res != CURLE_OK) 
        fprintf(stderr, "curl_easy_perform() failed: %s\n",
                curl_easy_strerror(res));
    else 
        puts(chunk.memory);

    curl_easy_cleanup(curl_handle);
    free(chunk.memory);
    curl_global_cleanup();
}

static size_t
WriteMemoryCallback(void *contents, size_t size, size_t nmemb, void *userp)
{
    size_t realsize = size * nmemb;
    struct MemoryStruct *mem = (struct MemoryStruct *)userp;

    mem->memory = realloc(mem->memory, mem->size + realsize + 1);
    if (mem->memory == NULL) { puts("not enougth mem."); return 1; }

    memcpy(&(mem->memory[mem->size]), contents, realsize);
    mem->size += realsize;
    mem->memory[mem->size] = 0;

    return realsize;
}
