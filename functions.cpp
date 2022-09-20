#include "functions.h"
#include <iostream>
#include <fstream>

using namespace std;

void printReadMe () {
    ifstream in;
    in.open("README.md");
    string word;
    while(!in.eof())
    {
        in >> word;
        cout << word << " ";
    }
    in.close();
}