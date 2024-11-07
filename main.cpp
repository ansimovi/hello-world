#include <iostream>
#include "add.h"
#include <unistd.h>


int main() {
    int i = 0;
    while(1) {
        std::cout << "Hello, World! add = " << add(2,3) << std::endl;
        sleep(100);
        if(i==10000)
            break;
        }
    return 0;
}