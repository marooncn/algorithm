f1 = @(x)[x*exp(x)-1];
x = SecantMethod(f1,0.4,0.6)
