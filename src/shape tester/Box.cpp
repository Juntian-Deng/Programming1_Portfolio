#include "Box.h"
#include <iostream>
Box::Box(){}

double Box::getVolume(void){
  return length*breadth*height;
}

double Box::getSurfaceArea(void){
      return 2*(length*breadth+breadth*height+length*height);
}

void Box::setLength(double len){
      length = len;
}

void Box::setBreadth(double bre){
      breadth = bre;
}

void Box::setHeight(double hei){
      height = hei;
}