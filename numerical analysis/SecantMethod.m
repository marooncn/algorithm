function y = SecantMethod(f,x0,x1,num,r)
%Secant Method for f(x) = 0, initial value is x0 and x1
if (nargin<5)
    r = 0.5e-5;
end
if (nargin<4)
    num = 10;
end
syms x;
n = 0;
while(abs(f(x1)) > r && n < num )
    fprintf("%d times iteration.\n",n+1);
    x = x1-f(x1)*(x1-x0)*1.0/(f(x1)-f(x0));
    x0 = x1;
    x1 = x;
    fprintf("The value is %f.\n",x);
    n = n + 1; 
end   
if(n>num)
    fprintf("The initial value is not good, please choose another value and try again!");
else
    y = x;
end
end        

