#include <iostream>
#include <string>
#include <memory>

int main() {

    constexpr int size = 9;
    
    std::unique_ptr<int[]> p { new int[size] };

    for (int i = 0; i < size; ++i) {
        p[i] = 7;
    }
    auto it = p.get(); 
    
    
    std::cout << it[0] << '\n';
    
}

    
