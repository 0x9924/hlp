//
// client.cpp
// 
// Compile with:
//     g++ server.cpp -lboost_system -lboost_thread -pthread
//
// Distributed under the Boost Software License, Version 1.0.
// (See accompanying file LICENSE_1_0.txt or copy at
// http://www.boost.org/LICENSE_1_0.txt)
//


#include <iostream>
#include <istream>
#include <ostream>
#include <string>
#include <boost/asio.hpp>

using boost::asio::ip::tcp;

namespace Method {
    std::string GET {"GET"};
    std::string HEAD{"HEAD"};
    std::string POST{"POST"};
    std::string PUT {"PUT"};
    std::string DELETE{"DELETE"};
}

struct Input {
    std::string server_name;
    std::string resource_name;
    std::string method;
    void print();
};

void print_help();
std::string get_method(std::string option);
Input parse_input(char** argv, int& optind, int argc);
void create_request_stream(Input& input, std::ostream& request_stream);

int main(int argc, char* argv[]) {
    try {
        Input input {parse_input(argv, optind, argc)};

        boost::asio::io_service io_service;

        // Get a list of endpoints corresponding to the server name.
        tcp::resolver resolver(io_service);
        tcp::resolver::query query(input.server_name, "http");
        tcp::resolver::iterator endpoint_iterator = resolver.resolve(query);

        // Try each endpoint until we successfully establish a
        // connection.
        tcp::socket socket(io_service);
        
        boost::asio::connect(socket, endpoint_iterator);

        // Form the request. We specify the "Connection: close" header
        // so that the server will close the socket after transmitting
        // the response. This will allow us to treat all data up until
        // the EOF as the content.
        boost::asio::streambuf request;
        std::ostream request_stream(&request);
        create_request_stream (input, request_stream);
            
        // Send the request.
        boost::asio::write(socket, request);

        // Read the response status line. The response streambuf will
        // automatically grow to accommodate the entire line. The
        // growth may be limited by passing a maximum size to the
        // streambuf constructor.
        boost::asio::streambuf response;
        boost::asio::read_until(socket, response, "\r\n");

        // // Check that response is OK.
        std::istream response_stream(&response);

        // Read the response headers, which are terminated by a blank
        // line.
        boost::asio::read_until(socket, response, "\r\n\r\n");

        // Process the response headers.
        std::string header;
        while (std::getline(response_stream, header) && header != "\r")
            std::cout << header << "\n";
        std::cout << "\n";

        // Write whatever content we already have to output.
        if (response.size() > 0)
            std::cout << &response;

        // Read until EOF, writing data to output as we go.
        boost::system::error_code error;
        while (boost::asio::read(socket, response,
                                 boost::asio::transfer_at_least(1),
                                 error)) {
            std::cout << &response;
        }
        if (error != boost::asio::error::eof) {
            throw boost::system::system_error(error);
        }

        std::cout << "\n";
        
    } catch (std::exception& e)  {
        std::cout << "Exception: " << e.what() << "\n";
    }
    
    return 0;
}


void print_help() {
    std::cout << "Usage: sync_client <server> <path>\n";
    std::cout << "Example:\n";
    std::cout << "  sync_client www.boost.org /LICENSE_1_0.txt\n";
}

std::string get_method(std::string option) {
    char opt_char {option[0]};
    switch (opt_char) {
    case 'g': //houd
        return Method::GET;
    case 'h':
        return Method::HEAD;
    case 'o':
        return Method::POST;
    case 'u':
        return Method::PUT;
    case 'd':
        return Method::DELETE;
    default:
        throw std::runtime_error{"unknown argument: " + option};
    }
}


Input parse_input(char** argv, int& optind, int argc) {
    const char* opt_string = {"m:h"};
    std::string method{Method::HEAD};
    std::string optarg_string;
    char c;    
    while ((c = getopt (argc, argv, opt_string)) != -1)
        switch (c) {
        case 'm':
            optarg_string = optarg;
            if (optarg_string.size() != 1) {
                std::cout << "bad option argument: '"
                          << optarg_string << "'\n";
                print_help();
                std::exit(1);
            }
            method = get_method(optarg_string);
            break;
        case 'h':
            print_help();
            std::exit (0);
            break;
        case '?':
            fprintf (stderr,
                     "Caracter de opcion desconocido `\\x%x'.\n",
                     optopt);
            std::exit(1);
        }
    if (argc - optind == 2) {
        return Input { argv[optind], argv[optind + 1], method};
    }
    if (argc - optind == 1) {
        return Input { argv[optind], "/", method};
    }
    else { print_help(); std::exit (1); }
}

void
create_request_stream(Input& input, std::ostream& request_stream) {
    request_stream << input.method << " " << input.resource_name
                   << " HTTP/1.0\r\n";
    request_stream << "Host: " << input.server_name << "\r\n";
    request_stream << "Accept: */*\r\n";
    request_stream << "Connection: close\r\n\r\n";
}

void Input::print() {
    std::cout << "Input:\n"
              << "\n\t server:\t" << server_name
              << "\n\t resource:\t" << resource_name
              << "\n\t method:\t " << method
              <<"\n";
}
