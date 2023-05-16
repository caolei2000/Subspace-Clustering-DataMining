function [Z, E] = solve_lrr(X, lambda)

Q = orth(X');  % ��� X' �ı�׼��������size(Q) = N*rank(X)
A = X*Q;  % ��ȡ�ֵ�,size=D*rank(X)
[Z, E] = lrra(X, A, lambda,false);  % size(Z) = rank(X)*N
Z = Q*Z;  % �� Z �ָ�Ϊ����,N*N

end