#ifndef BOX_H
#define BOX_H
#include <iostream>
class Box{
  public:
    Box();
    double length = 0;
    double breadth = 0;
    double height = 0;

    double getVolume(void);  
    double getSurfaceArea(void);
    void setLength(double len);
    void setBreadth(double bre);
    void setHeight(double hei);  
};

#endif