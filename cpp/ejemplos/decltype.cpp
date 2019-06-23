#include <iostream>
#include <vector>

template<typename Container, typename Index>
decltype(auto) get(Container& c, Index i) -> decltype(c.at(i)) {
    if (i < static_cast<Index>(c.size())) {
        std::cout << "getting " << i << "\n";
        return c.at(i);
    }
    std::cout << "bad index " << i << "\n";

    return c.back();
}

int main () {
    std::vector<float> fls {1.1, 2.3, 5.6, 1.09};
    decltype(auto) elem = get(fls, 12);
    std::cout << elem << "\n";

    std::cout << "elem type: " << typeid(elem).name() << "\n";
    std::cout << "container type: "
              << typeid(fls).name() << "\n";
    
    auto foo = [](float f)  { return f; };

    std::cout << "foo type: " << typeid(foo).name() << "\n";
        
}
