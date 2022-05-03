function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
%falsePosition finds the root of a function using false position me

%OG VALUES
maxit = 200;
ea = 100;
es = .0001;
xr = xl;
fxl = func(xl);
fxu = func(xu);
iter = 0;

if nargin < 3
    error('Cannot find root with Bracketing Method')
end
if fxl*fxu >= 0
    if fxl == 0
        xr= xl
    end
    if fxu == 0 
        xr = xu
    end
    error('Does not bracket root')
end
while ea >= es || iter>=200
    xrold = xr; iter = iter+1;
    if iter == 1
        xr = xu - (fxu*(xl-xu))/(fxl-fxu);
    else 
        xr = xu - (func(xu)*(xl-xu))/(func(xl)-func(xu));
    end
    if iter == 1
         ea = abs((xr-xl)/xr)*100;
    elseif iter > 1
        ea = abs((xr-xrold)/xr)*100;
    end
    if ea <= es
        break
    end
    if func(xr)*func(xl) > 0
        xl= xr;
    end
    if func(xr)*func(xu) > 0
        xu = xr;
    end
    
end


root = xr
iter = iter
ea = ea
fx = func(xr)

end
