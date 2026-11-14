#include <iostream>
#include "config.h"

int add(int a, int b);

int main()
{
    std::cout << "C++ Makefile Demo\n";

    std::cout << "Application Version: "
              << APP_VERSION << "\n";

#if APP_DEBUG
    std::cout << "Build Configuration: DEBUG\n";
#else
    std::cout << "Build Configuration: RELEASE\n";
#endif

    int result = add(10, 20);

    std::cout << "10 + 20 = " << result << "\n";

    return 0;
}
