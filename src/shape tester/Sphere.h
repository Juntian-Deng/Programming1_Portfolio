#include <iostream>
#include <math.h>
#include <cmath>
#define USE_MATH_DEFINES
using namespace std;

class Sphere{
  public:
    Sphere();
    double radius = 0;
    double getVolume(void);
    double getSurfaceArea(void);
    void setRadius(double rad);   
};