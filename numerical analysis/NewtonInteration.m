function y = NewtonSe(f,x0,num,r)
%Newton Search for f(x) = 0, initial value is x0, the largest interation number is num and r is the tolerance error.
if (nargin<4)
    r = 0.5e-5;
end
if (nargin<3)
    num = 10;
end
syms x;
n = 0;
df(x) = diff(f(x));
while(abs(f(x0)) > r && n < num )
    fprintf("%d times iteration.\n",n+1);
%   R=feval(df,x0);
    x0 = eval(x0 - f(x0)*1.0/df(x0));
    fprintf("The value is %f.\n",x0);
 %   syms a b c d;
 %  [a, b] = size(f(x0)*1.0);
 %  [c, d] = size(df(x0));
 %  fprintf("f(x0)*1.0 is %d*%d \n",a,b);
 %  fprintf("diff(f(x0)) is %d*%d \n",c,d); 
    n = n + 1; 
end   
if(n>num)
    fprintf("The initial value is not good, please choose another value and try again!");
else
    y = x0;
end
end      
