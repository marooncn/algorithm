%For showing Runge's Phenomenon
X = (-1.0:0.2:1.0);  %interplotion points
f = @(x)(1.0./(1+25*x.^2));
Y = f(X);  %the corresponding value of interplotion points
k = 1;
for i=-1.0:0.03:1.0
    E(k) = f(i) - LagrangeInterpolation(X,Y,i);
    k = k+1;
end
x = (-1.0:0.03:1.0);
plot(x,E);
xlabel('x'),ylabel('E(x)=L(x)-f(x)');
title("Runge's Phenomenon");
