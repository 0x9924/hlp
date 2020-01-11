#include  <boost/asio.hpp>
#include <iostream>
#include <string>

int main (int argc, char* argv[]) {

    unsigned short port {0x9924};
    auto ip_addr = boost::asio::ip::address_v4::any();
    
    boost::asio::ip::tcp::endpoint ep(ip_addr, port);
    return 0;
}
    
