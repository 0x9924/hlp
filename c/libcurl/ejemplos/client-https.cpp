/***************************************************************************
 *                                  _   _ ____  _
 *  Project                     ___| | | |  _ \| |
 *                             / __| | | | |_) | |
 *                            | (__| |_| |  _ <| |___
 *                             \___|\___/|_| \_\_____|
 *
 * Copyright (C) 1998 - 2015, Daniel Stenberg, <daniel@haxx.se>, et al.
 *
 * This software is licensed as described in the file COPYING, which
 * you should have received as part of this distribution. The terms
 * are also available at https://curl.haxx.se/docs/copyright.html.
 *
 * You may opt to use, copy, modify, merge, publish, distribute and/or sell
 * copies of the Software, and permit persons to whom the Software is
 * furnished to do so, under the terms of the COPYING file.
 *
 * This software is distributed on an "AS IS" basis, WITHOUT WARRANTY OF ANY
 * KIND, either express or implied.
 *
 ***************************************************************************/
/* <DESC>
 * Simple HTTPS GET
 * </DESC>
 */
#include <stdio.h>
#include <curl/curl.h>
#include <stdlib.h>
#include <string>
#include <iostream>

void print_help(char* program_name) {
    printf ("usage: \n"
            "./%s <server name> [<server name>...]\n", program_name);
}


size_t WriteCallback(char *contents, size_t size, size_t nmemb, void *userp)
{
    ((std::string*)userp)->append((char*)contents, size * nmemb);
    return size * nmemb;
}

std::string get_html(std::string url) {
    CURLcode res;
    CURL *curl;

    curl = curl_easy_init();
        
    std::string readBuffer;
    if(curl) {
        curl_easy_setopt(curl, CURLOPT_URL, url.c_str());
        curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, WriteCallback);
        curl_easy_setopt(curl, CURLOPT_WRITEDATA, &readBuffer);

        /* Perform the request, res will get the return code */
        res = curl_easy_perform(curl);
        /* Check for errors */
        if(res != CURLE_OK) {
            fprintf(stderr, "curl_easy_perform() failed: %s\n",
                    curl_easy_strerror(res));
        }
        /* always cleanup */
        curl_easy_cleanup(curl);
    }
    return readBuffer;
}



int main(int argc, char** argv) {

    if (argc < 2) { print_help(argv[0]); exit(0); }
    std::string readBuffer;

    
    curl_global_init(CURL_GLOBAL_DEFAULT);

    for (int i = 1; i < argc; ++i) {
        std::string url {argv[i]};
        readBuffer = get_html(url);
        std::cout << readBuffer << std::endl;
    }


    curl_global_cleanup();

    return 0;
}
