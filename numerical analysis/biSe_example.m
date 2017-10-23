format long
f = @(x)[sin(x)-x^2/2.0];
x0 = biSe(f,1,2,0.5e-5)
