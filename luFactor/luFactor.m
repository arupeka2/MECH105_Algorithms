function [L,U,P] = luFactor(A)
% luFactor(A)
%	LU decomposition with pivotiing
% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
% P = the permutation matrix
[r,c] = size(A);
L = eye(r);
U = A;
P = eye(r);
if r ~= c
    error('Rows must be equal to columns')
end
for p = 1:r
    [~,maxrow] = max(abs(U(p:r,p)));
    maxrow = maxrow+p-1;
    if maxrow ~= p
        U([p,maxrow],:) = U([maxrow,p],:);
        P([p,maxrow],:) = P([maxrow,p],:);
        if maxrow >= 2
            L([maxrow,p],1:p-1) = L([p,maxrow],1:p-1);
        end
    end
    for n = p+1:r
        L(n,p) = U(n,p)/U(p,p);
        U(n,p:c) = U(n,p:c) - L(n,p)*U(p,p:c);
    end
end
if size(L) ~= size(A)
    error('Must be an error somewhere')
elseif size(P) ~= size(A)
    error('Must be an error somewhere')
elseif size(U) ~= size(A)
    error('Must be an error somewhere')
else
    disp('L, U, and P have correct dimensions')
end
L*U == P*A
