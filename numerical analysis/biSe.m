function y = biSe(f, a, b, r)
% binary search method for f(x) = 0, the lower and upper bound are a and b respectively. r is the tolerance error.
syms c;
if (f(a)*f(b) > 0)
    printf("The initial value is wrong");
else
  while(f((a+b)/2)~=0 || abs(f(a)-f(b)) > r)
    c = (a+b)/2;
    if (f(a)*f(c) < 0)
      b = c;
    else
      a = c;
    end
  end
  y=(a+b)/2;   
end
end
