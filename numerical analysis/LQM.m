function P = LQM(X,Y,r)
% The least-square method
%X and Y is interpolation points and corresponding value. r is Polynomial order.
n = length(X);
if ( length(Y) ~= n)
    fprintf("The input two vectors aren't the same size!");
    return ;
end
if (r > n-1)
    fprintf("The number of interpolation points isn't enough!");
    return;
end
for i=1:r+1
    B(i) = 0;
    for j=1:r+1 
        A(i,j) = 0;
        for k=1:n
            A(i,j) = A(i,j) + X(k)^(i-1)*X(k)^(j-1);
        end
%         fprintf("A(%d,%d)=%f\n",i,j,A(i,j));     
    end
    for k=1:n
        B(i) = B(i) + Y(k)*X(k)^(i-1);
    end
%     fprintf("B(%d)=%f\n",i,B(i)); 
end
P = A\B';

%inverse P to make P(1) is the highest order rather than the lowest.
for i=1:r+1
    Q(i) = P(r+2-i);
end
P = Q;

end
 
