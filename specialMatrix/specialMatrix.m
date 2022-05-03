% Abigail Rupeka 1/26/2021
% Mech 105 HW #5 Algorithm
% This function should return a matrix A as described in the problem statement
% Inputs n is the number of rows, and m the number of columns

function [A] = specialMatrix(n,m)
% This function allows you to to have a matrix with dimensions as follows:
% -This is a matrix with dimensions n by m
% -Matrix has a first row from 1 to m
% -Matrix has a first column from 1 to n
% -Matrix has the rest of the elements where the row above and the row to
%  the left added together equal the value of a specific position in the
%  matrix
n = input('Row dimensions?   ');
m = input('Column Dimensions?   ');
if n <= 0 || m <= 0
    error('Input must be a positive integer')
end
A = zeros(n,m);
for i = 1:n
    for j = 1:m
        if i == 1
            A(i,j) = j;
        elseif j == 1
            A(i,j) = i;
        else
        A(i,j) = A(i-1,j)+A(i,j-1);
        end
    end
end
