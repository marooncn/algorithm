function yn = RK4(f, x0, y0, n, h)
% Classic Runge-Kutta Methods for solving y(x0+n*h)
% dy/dx = f
% y(x0) = y0
syms x y;
if (nargin == 4)
    h = 0.1;
end
for i=1:n
    x = x0;
    y = y0;
    k1 = f(x,y);
    x = x0+h/2.0;
    y = y0+h/2.0*k1;
    k2 = f(x,y);
    y = y0+h/2.0*k2;
    k3 = f(x,y);
    x = x0+h;
    y = y0+h*k3;
    k4 = f(x,y);
    y0 = y0+h/6.0*(k1+2*k2+2*k3+k4);
    x0 = x0+h;
end
fprintf("y(%f)=%f",x0,y0);
yn = y0;

end

