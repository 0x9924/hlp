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

    boost::system::error_code ec;
    auto ip_addr = boost::asio::ip::address::from_string(ip, ec);

    if (ec.value() != 0) {
        std::cerr << "error: bad ip. msg: " << ec.message()
                  << '\n';
        return ec.value();
    }
    boost::asio::ip::tcp::endpoint ep(ip_addr, port);
    return 0;
}
    
