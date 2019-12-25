#include <iostream>
#include <pqxx/pqxx> 

int main(int argc, char* argv[]) {
    try {

        if (argc != 4) {
            std::cout << "Use: " << argv[0] << " DBNAME USER PASS\n";
            std::exit(1);
        }

        std::string dbname {argv[1]};
        std::string user_name {argv[2]};
        std::string user_passw {argv[3]};
        std::string connection{"dbname = "+ dbname +
                               " user = " + user_name +
                               " password = " + user_passw +
                               " hostaddr = 127.0.0.1" };
        
        pqxx::connection C(connection);
        
        if (C.is_open()) { std::cout << "Opened database successfully: " << C.dbname() << std::endl;
        } else {
            std::cout << "Can't open database" << std::endl;
            return 1;
        }
        C.close ();
    } catch (const std::exception &e) {
        std::cerr << e.what() << std::endl;
        return 1;
    }
}
