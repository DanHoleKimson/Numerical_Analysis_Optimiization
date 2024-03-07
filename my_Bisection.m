function [start,end1,liter] = my_Bisection(start,end1,tol,fnc_f)
liter = 0;

while((end1 - start) > tol)
    
    m = (start + end1) / 2;
   if sign(fnc_f(start)) == sign(fnc_f(m))
       start = m;
   else
       end1 = m;
   end
    liter = liter + 1;

end

end