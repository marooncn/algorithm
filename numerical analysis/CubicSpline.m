%Cubic Spline Interpolation
syms x;
f = 1.0./(1+25*x.^2);
df = diff(f);  %f(x0)=s(x0),f(x1)=s(x1),f'(x0)=s(x0),f'(x1)=s(x1)
% df = diff(df);  %f(x0)=s(x0),f(x1)=s(x1),f''(x0)=s(x0),f''(x1)=s(x1)
for i=-1.0:0.2:1.0
    syms a b c d;
    x1 = i+0.2;
    y0 = eval(subs(f,i));
    y1 = eval(subs(f,x1));
    dy0 = eval(subs(df,i));
    dy1 = eval(subs(df,x1));
    i3 = i*i*i;
    i2 = i*i;
    x13 = x1*x1*x1;
    x12 = x1*x1;
    [a,b,c,d] = solve(i3*a+i2*b+i*c+d==y0,x13*a+x12*b+x1*c+d==y1,i2*3*a+i*2*b+c==dy0,x12*3*a+x1*2*b+c==dy1,a,b,c,d);
    fprintf("a = %f,b = %f,c = %f,d = %f\n",a,b,c,d);
    y = @(x)[a*x.^3 + b*x.^2 + c*x + d];
    j = [i:0.01:i+0.2];
    plot(j,y(j));
    hold on;
end
xlabel('x'),ylabel('y');
title('Cubic Spline Interpolation');
    
    
