#include  <boost/asio.hpp>
#include <iostream>
#include <string>

int main (int argc, char* argv[]) {
    if (argc == 1) {
        std::cout << "use: "<< argv[0] << " <ip addr>\n";
        return 0;
    }
    std::string ip{argv[1]};
    unsigned short port {0x9924};

    try {

        boost::asio::ip::tcp::endpoint ep(
            boost::asio::ip::address::from_string(ip),
            port);

        boost::asio::io_service service;

        boost::asio::ip::tcp::socket socket(service, ep.protocol());

        socket.connect(ep);
    } catch (boost::system::system_error& e) {
        std::cerr << "error connecting. Msg: "
                  << e.what() << '\n';
        return e.code().value();
    }

    return 0;
}
    
