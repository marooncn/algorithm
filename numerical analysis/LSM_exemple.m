 X = [3,4,5,6,7,8,9];
 Y = [2.01,2.98,3.50,5.02,5.47,6.02,7.05];
 P1 = LSM(X,Y,1)  %一次拟合
 P2 = LSM(X,Y,2)  %二次拟合
 P3 = LSM(X,Y,3)  %三次拟合
 y = poly2str(P3,'x')  %显示表示出多项式的形式
 polyval(P3,4.6)  %计算x=4.6时拟合多项式对应的数值
 x = [3:0.1:9];
 plot(X,Y,'b',x,polyval(P1,x) ,'y',x,polyval(P3,x) ,'g')
 xlabel('x'),ylabel('y');
 legend('original data','r=1','r=3');
 title("The least-square method")
