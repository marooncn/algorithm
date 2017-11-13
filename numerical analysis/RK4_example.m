f = @(x,y)[3*x-y];
yn = RK4(f,0,1,10)

% if using function to define f, for example
% function f = fx(x,y)
% f = 3*x-y;
% end
% then use function handle to transfer
% yn = RK4(@fx,0,1,10)

% Compare with Euler Method
% yn = Euler(f,0,1,10)
