#include <boost/asio.hpp>
#include <iostream>
#include <string>

int main () {
    const int BACKLOG_SIZE {30};

    unsigned short port {0x9924};

    boost::asio::ip::tcp::endpoint ep (
        boost::asio::ip::address_v4::any(),
        port);

    boost::asio::io_service service;

    try {
        boost::asio::ip::tcp::acceptor acceptor(service, ep.protocol());
        acceptor.bind(ep);
        acceptor.listen(BACKLOG_SIZE);
        boost::asio::ip::tcp::socket socket(service);
        acceptor.accept(socket);
        
    } catch (boost::system::system_error& e) {
        std::cerr << "error msg: "
                  << e.what() << '\n';
        return e.code().value();
    }
}
