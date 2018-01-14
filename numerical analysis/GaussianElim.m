function X = GaussianElim(A, B)
%Gaussian Elimination for solving AX = B
[n,~] = size(A);
for j=1:n
    %列选主元
    for i=j+1:n
        if(abs(A(j,j))<abs(A(i,j)))
            for k=1:n
                s = A(j,k);
                A(j,k) = A(i,k);
                A(i,k) = s;
                s = B(i);
                B(i) = B(j);
                B(j) = s;
            end
        end
    end
    if (A(j,j)==0)
        fprintf("Parametre matrix is singular!");
        break;
    end  
    %高斯消元
    for i=j+1:n
        if(A(i,j) ~= 0)
            r = A(j,j)/A(i,j);
            A(i,:) = A(j,:) - r.*A(i,:);
            B(i) = B(j)- r.*B(i);
        end
    end
end

%输出高斯消元后的矩阵
% for i=1:n
%         for j=1:n
%             fprintf("A(%d,%d)=%f ",i,j,A(i,j));
%         end
%          fprintf("\n");
%          fprintf("B(%d)=%f \n",i,B(i));
% end

%求解X
X(n) = B(n)/A(n,n);
for i=n-1:-1:1
    s = 0;
    for j=i+1:n
        s = s + A(i,j)*X(j);
    end
    X(i) = (B(i)-s)/A(i,i);
   % fprintf("A(%d,%d)=%f",i,i,A(i,i));
end
end
