function [A] = get_Aff_LRR(Z)
% LRR算法有一个"由表示矩阵得到邻接矩阵"的方法
% Input:
%       Z: 表示矩阵;
% Output:
%       A: 邻接矩阵(相似矩阵);

[U,S,~] = svd(Z,'econ'); 
S = diag(S);
r = sum(S>1e-4*S(1));
U = U(:,1:r);S = S(1:r);
U = U*diag(sqrt(S));
U = normr(U);
A = (U*U').^4; % 这里有疑问？论文里写得好像平方项(这个地方2\4, 根据不同的数据集有不同的效果)

end

