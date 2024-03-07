function [x,liter] = my_Fixed(x,xerror,tol,fnc_g)
liter = 0;
while xerror > tol
    xnew = fnc_g(x);
    xerror = abs(xnew - x);
    x = xnew;
    liter = liter + 1;
end
end