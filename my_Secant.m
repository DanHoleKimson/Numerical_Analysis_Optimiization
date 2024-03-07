function [x2,liter] = my_Secant(x0,x1,xerror,tol,fnc)
liter = 0;
while xerror > tol
    y0 = fnc(x0);
    y1 = fnc(x1);
    x2 = x1-y1*(x1-x0)/(y1-y0);
    xerror = abs(x2-x1);
    x0 = x1;
    x1 = x2;
    liter = liter +1;
end

end