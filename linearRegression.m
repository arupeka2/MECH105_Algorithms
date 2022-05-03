function [fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)
% Abigail Rupeka    4/23/22
% linearRegression Computes the linear regression of a data set
%   Compute the linear regression based on inputs:
%     1. x: x-values for our data set
%     2. y: y-values for our data set
%
%   Outputs:
%     1. fX: x-values with outliers removed
%     2. fY: y-values with outliers removed
%     3. slope: slope from the linear regression y=mx+b
%     4. intercept: intercept from the linear regression y=mx+b
%     5. Rsquared: R^2, a.k.a. coefficient of determination

[~,n] = size(x);
[sortedY, sortOrder] = sort(y);
sortedX = x(sortOrder);
Q1 = sortedY(floor((n+1)/4));
Q3 = sortedY(floor((3*n+3)/4));
IQR = Q3-Q1;
if size(x)~=size(y)
    error('arrays must be the same size')
end
for i = 1:n
    if sortedY(i) < (Q1-(IQR * 1.5))
        sortedX(i) = NaN;
        sortedY(i) = NaN;
    end
end
for i = 1:n
    if sortedY(i) > ((IQR*1.5)+Q3)
        sortedX(i) = NaN;
        sortedY(i) = NaN;
    end
end
sortedX(isnan(sortedX)) = [];
sortedY(isnan(sortedY)) = [];
if size(sortedX)~=size(sortedY)
    error('arrays must be the same size')
end
[~,newN] = size(sortedX);
fX = sortedX;
fY = sortedY;
sumx = sum(fX);
sumy = sum(fY);
avgx = sumx/newN;
avgy = sumy/newN;
sumxy = 0;
sumxinsq = 0;
for j = 1:newN
    sumxy = sumxy + fX(j)*fY(j);
    sumxinsq = sumxinsq + fX(j)^2;
end
slope = (sumxy*newN-sumx*sumy)/(newN*sumxinsq-sumx^2);
intercept = (avgy - slope*avgx);
Sr = 0;
St = 0;
for k = 1:newN
    Sr = Sr + ((fY(k)-intercept-slope*(fX(k)))^2);
    St = St + (fY(k)-avgy)^2;
end
Rsquared = (St-Sr)/St;
