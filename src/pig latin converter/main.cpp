#include <iostream>
#include <string>

using namespace std;

int main()
{
    string str1, piglatin;
    cout<<"Enter a word to be converted to Pig Latin:";
    getline(cin, str1);
    if (str1.length()>=1)
    {
        piglatin =  str1.substr(0,1) + "ay";
         str1.erase(0,1);
         str1 = str1 + piglatin;
          cout << str1;
    }
    cout << endl;
    return 0;
}