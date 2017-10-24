function y = LagrangeInterpolation(X,Y,xh)
%Lagrange Interpolation, 
%X and Y is interpolation points and corresponding values.
n = length(X);
if ( length(Y) ~= n)
    fprintf("The input two vectors aren't the same size!");
    return ;
end
y = 0;
for i=1:n
    l(i) = 1;
    for j=1:n
        if(j~=i)
            l(i) = l(i)*(xh-X(j))*1.0/(X(i)-X(j));
        end
    end
    y = y + l(i)*Y(i);
end
end
