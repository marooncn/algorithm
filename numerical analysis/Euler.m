function yn = Euler(f, x0, y0, n, h)
% Euler integration  for solving y(x0+n*h)
% dy/dx = f
% y(x0) = y0
syms y1;
if (nargin == 4)
    h = 0.1;
end
% explicit Euler integration
% y(n+1) = y(n) + h*f(n)
% implicit Euler integration
% y(n+1) = y(n) + h*f(n+1)
ye = y0;
yi = y0;
for i=1:n
    ye = ye + h*f(x0,ye);  % explicit method
    yi = yi + h*f(x0,ye);  % implicit method
    x0 = x0 + h; 
end
fprintf("explicit euler method: y(%f)=%f\n",x0,ye);
fprintf("implicit euler method: y(%f)=%f\n",x0,yi);
flag = input('Return implicit results(0)or explcit(1)?');
if (flag==1)
    yn = ye;
else
    yn = yi;
end
end
