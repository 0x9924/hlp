#include  <boost/asio.hpp>
#include <iostream>
#include <string>

int main () {

    boost::asio::io_service service;
    auto proto = boost::asio::ip::tcp::v4();
    boost::asio::ip::tcp::acceptor acceptor(service);
    
    //boost::asio::ip::tcp::socket socket(service);
    boost::system::error_code ec;
    acceptor.open(proto, ec);

    if (ec.value() != 0) {
        std::cerr << "error open socket. msg: "
                  << ec.message()
                  << '\n';
        return ec.value();
    }

}
