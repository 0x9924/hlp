#include  <boost/asio.hpp>
#include <iostream>
#include <string>

int main (int argc, char* argv[]) {

    unsigned short port {0x9924};
    boost::asio::ip::tcp::endpoint ep(
        boost::asio::ip::address_v4::any(),
        port);

    boost::asio::io_service service;
    boost::asio::ip::tcp::acceptor acceptor(service, ep.protocol());

    boost::system::error_code ec;
    acceptor.bind(ep, ec);

    if (ec.value() != 0) {
        std::cerr << "error binding socket. msg: "
                  << ec.message()
                  << '\n';
        return ec.value();
    }

    return 0;
}
