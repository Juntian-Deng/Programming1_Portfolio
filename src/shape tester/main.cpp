#include <iostream>
#include <math.h>
#include <cmath>
#include "Box.h"
#include "Sphere.h"
#include "Pyramid.h"
#define USE_MATH_DEFINES
using namespace std;


int main() {
  int user;
  cout<<"Welcome to shape maker! Lets find and volume and surface area for a few shapes..."<<endl;
  cout<<"To build a box press 1"<<endl;
  cout<<"To build a sphere press 2"<<endl;
  cout<<"To build a pyramid press 3"<<endl;
  cin>>user;
  if (user == 1){
    Box box1;
    cout<<"Great! Let's start with a box!"<<endl;
    cout<<"Enter the width of the box: ";
    cin>>box1.breadth; box1.setBreadth(box1.breadth);
    cout<<"Enter the height of the box: ";
    cin>>box1.height; box1.setHeight(box1.height);
    cout<<"Enter the length of the box: ";
    cin>>box1.length; box1.setLength(box1.length);
    cout<<"The volume of your box is: "<<box1.getVolume()<<endl;
    cout<<"The surface area of your box is: "<<box1.getSurfaceArea()<<endl;
  }else if (user == 2){
    Sphere sphere1;
    cout<<"Great! Let's start with a sphere!"<<endl;
    cout<<"Enter the radius of the sphere: "<<endl;
    cin>>sphere1.radius; sphere1.setRadius(sphere1.radius);
    cout<<"The volume of your sphere is: "<<sphere1.getVolume()<<endl;
    cout<<"The surface area of your sphere is: "<<sphere1.getSurfaceArea()<<endl;
  }else if (user == 3){
    Pyramid pyramid1;
    cout<<"Great! Let's start with a pyramid!"<<endl;
    cout<<"Enter the base length of the pyramid: ";
    cin>>pyramid1.base_edge; pyramid1.setBase(pyramid1.base_edge);
    cout<<"Enter the height of the pyramid: ";
    cin>>pyramid1.height; pyramid1.setHeight(pyramid1.height);
    cout<<"The volume of your pyramid is: "<<pyramid1.getVolume()<<endl;
    cout<<"The surface area of your pyramid is: "<<pyramid1.getSurfaceArea()<<endl;
  }
}