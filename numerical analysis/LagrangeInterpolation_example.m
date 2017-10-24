%For showing Runge's Phenomenon
X = (-1.0:0.2:1.0);  %interplotion points
f = @(x)(1.0./(1+25*x.^2));
Y = f(X);   %the corresponding values of interplotion points
k = 1;
for i=-1.0:0.03:1.0
    L(k) = LagrangeInterpolation(X,Y,i);
    E(k) = abs(f(i) - L(k));
    k = k+1;
end
x = (-1.0:0.03:1.0);
plot(x,f(x),'b',x,L,'g',x,E,'r');
legend('f(x)','L(x)','|E(x)|');
xlabel('x'),ylabel('y');
title("Runge's Phenomenon");
% you can also execute linearInterpolation.m to watch piecewise linear interpolation of the same function.
