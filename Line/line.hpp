#ifndef LINE_HPP
#define LINE_HPP
#include "Eigen/core"
#include "iostream"
#include "math.h"
class Line {
//用点法式表示直线，以兼容水平线和竖直线；
friend std::bool isParallel(const Line&, const Line &);
friend std::bool isVertical(const Line&, const Line &);
public:
  Line() = default; 
  Line(std::vector<Eigen::Vector2d> &data);
  std::bool ofLine(Eigen::Vector2d &data);

private:
  std::double nx, ny;  //直线的单位法向量
  std::double ax, ay;  //过直线的一点
}

Line::Line(std:vector<Eigen::Vector2d> &data): ax(data[0].x()), ay(data[0].y()) {
  if (data.size() < 2)
    cout<<"The dot number is less than 2, please check and try again."<<endl;
  else if(data.size() == 2) {
    nx = data[0].y() - data[1].y();
    ny = data[0].x() - data[0].x();
    double norm = sqrt(nx*nx+ny*ny);
    nx *= norm;
    ny *= norm; }
  else {
    double meanX(0.0), meanY(0.0), norm;
    double den(0.0), num(0.0);
    int i, size = data.size();
    for (i=0; i<size; i++) {
      meanX += data[i].x();
      meanY += data[i].y();
      num += data[i].x()*data[i].y();
      den += data[i].x()*data[i].x(); 
    }
    meanX /= size;
    meanY /= size;
    num -= size*meanX*meanY;
    den -= size*meanX*meanX;  // b=num/den, a=meanY-b*meanX, y=b*x+a
    if (den < 1e-12)
      { nx = 1.0; ny = 0.0;}
    else 
      { norm = sqrt(den*den+num*num);
        nx = num*norm;
        ny = (-den)*norm;
      }
   ax = meanX;
   ay = meanY;
 }
}

std::bool line::ofLine(Eigen::Vector2d &data) {
  return data.x()*nx+data.y()*ny==0;
}

std::bool isParallel(const Line &l1, const Line &l2) {
  return l1.nx==l2.nx && l1.ny==l2.ny;
}

std::bool isVertical(const Line &l1, const Line &l2) {
  return l1.nx*l2.nx+l1.ny*l2.nx==0;
}

#denif 
  
