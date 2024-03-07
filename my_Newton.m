function [x,liter] = my_Newton(x,xerror,tol,fnc,fnc_d)
liter = 0;
while xerror > tol
    y = fnc(x);
    yp = fnc_d(x);
    newx = x-y/yp;
    xerror = abs(newx - x);
    x = newx;
    liter = liter + 1;
end


end