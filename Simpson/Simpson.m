function [I] = Simpson(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule 
% Inputs
% x = the vector of equally spaced independent variable
% y = the vector of function values with respect to x  
% Outputs:
% I = the numerical integral calculated 
if nargin < 2
error('need at least two input arguments')
end
[~,n] = size(x);
[~,m] = size(y);
if n ~= m
    error('x and y must be same length')
end

spacing = diff(x);
if max(spacing)~=min(spacing)
    error('must have equal spacing') 
end
I = 0;

if n == 2
    warning('Trapezoidal Rule will be used') 
    I = ((x(n)-x(1))/2)*(y(n)+y(1));
    iter = 0;
elseif rem(n,3) ~= 0 || n==3
    iter = (n-1)/2;
elseif rem(n,2) == 0
    warning('Trapezoidal Rule will be used for last interval') 
    iter = (n-2)/2;
end
for i= 1:iter
    I = I + ((x(i*2+1)-x(i*2-1))/6)*(y(i*2-1)+ 4*y(i*2) + y(i*2+1));
    
end
if floor(n/2) == ceil(n/2) && n ~= 2
    if rem(n,3) == 0
        warning('Trapezoidal Rule will be used for last interval') 
        trap = ((x(n)-x(n-1))/2)*(y(n)+y(n-1));
        I = I + trap;
    end
end
