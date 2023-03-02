#include <iostream>
#include "Sphere.h"
#include <math.h>
#include <cmath>
#define USE_MATH_DEFINES
using namespace std;
Sphere::Sphere(){}

double Sphere::getVolume(void){
  return pow(radius, 3)*M_PI*4/3;
}

double Sphere::getSurfaceArea(){
  return 4*pow(radius, 2)*M_PI;
}
void Sphere::setRadius(double rad){
  radius = rad;
}