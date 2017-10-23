f1 = @(x)[x*exp(x)-1];
x0 = NewtonSe(f1,0.5)
%{
1 times iteration.
The value is 0.571020.
2 times iteration.
The value is 0.567156.
3 times iteration.
The value is 0.567143.

x =

   0.567143290533261
%}
% test
subs(f1,x)
% ans =

%     (51083726 23822543*exp(5108372623822543/9007199254740992))/9007199254740992 - 1
eval(subs(f1,x))
% ans =

%     3.411950721954327e-10

