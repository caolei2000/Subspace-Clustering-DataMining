function [Z, E] = solve_lrr(X, lambda)

Q = orth(X');  % 获得 X' 的标准正交基，size(Q) = N*rank(X)
A = X*Q;  % 获取字典,size=D*rank(X)
[Z, E] = lrra(X, A, lambda,false);  % size(Z) = rank(X)*N
Z = Q*Z;  % 将 Z 恢复为方阵,N*N

end