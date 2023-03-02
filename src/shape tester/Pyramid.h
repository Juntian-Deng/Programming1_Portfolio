#include <iostream>
#include <math.h>
#include <cmath>
using namespace std;
class Pyramid{
  public:
    Pyramid();
    double base_edge = 0;
    double height = 0;
    double getVolume(void);

    double getSurfaceArea(void);
    void setBase(double base);
    
    void setHeight(double hei);
};