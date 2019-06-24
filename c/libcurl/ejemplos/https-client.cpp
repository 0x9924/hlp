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
            "./%s <server name>\n", program_name);
}


size_t WriteCallback(char *contents, size_t size, size_t nmemb, void *userp)
{
    ((std::string*)userp)->append((char*)contents, size * nmemb);
    return size * nmemb;
}

std::string get_html(CURL* curl, std::string url) {

}

int main(int argc, char** argv) {

    if (argc != 2) { print_help(argv[0]); exit(0); }
    CURL *curl;
    CURLcode res;
    std::string readBuffer;

    std::string server_name {argv[1]};
    
    curl_global_init(CURL_GLOBAL_DEFAULT);

    curl = curl_easy_init();
    if(curl) {
        curl_easy_setopt(curl, CURLOPT_URL, server_name.c_str());

#ifdef SKIP_PEER_VERIFICATION
        /*
         * If you want to connect to a site who isn't using a
         * certificate that is signed by one of the certs in the CA
         * bundle you have, you can skip the verification of the
         * server's certificate. This makes the connection A LOT LESS
         * SECURE.
         *
         * If you have a CA cert for the server stored someplace else
         * than in the default bundle, then the CURLOPT_CAPATH option
         * might come handy for you.
         */
        curl_easy_setopt(curl, CURLOPT_SSL_VERIFYPEER, 0L);
#endif

#ifdef SKIP_HOSTNAME_VERIFICATION
        /*
         * If the site you're connecting to uses a different host name
         * that what they have mentioned in their server certificate's
         * commonName (or subjectAltName) fields, libcurl will refuse
         * to connect. You can skip this check, but this will make the
         * connection less secure.
         */
        curl_easy_setopt(curl, CURLOPT_SSL_VERIFYHOST, 0L);
#endif
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

    curl_global_cleanup();

    std::cout << readBuffer << std::endl;

    return 0;
}
