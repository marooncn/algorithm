%piecewise linear interpolation 
f = @(x)(1.0./(1+25*x.^2));
for i=-1.0:0.2:1.0
    x0 = i;
    x1 = i+0.2;
    y0 = f(x0);
    y1 = f(x1);
    y = @(x)[(x-x0)./(x1-x0).*(y1-y0)+y0];
    j = (i:0.01:i+0.2);
    plot(j,y(j));
    hold on;
end
xlabel('x'),ylabel('y');
title('piecewise linear interpolation ');
