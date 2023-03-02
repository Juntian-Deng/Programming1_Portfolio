#include <iostream>
#include "Pyramid.h"
#include <math.h>
#include <cmath>
using namespace std;
Pyramid::Pyramid(){}

double Pyramid::getVolume(void){
  return pow(base_edge, 2)*height*1/3;
}

double Pyramid::getSurfaceArea(void){
  return pow(base_edge,2)+2*base_edge*sqrt(base_edge*base_edge/4+height*height);
}

void Pyramid::setBase(double base){
  base_edge = base;
}

void Pyramid::setHeight(double hei){
  height = hei;
}    