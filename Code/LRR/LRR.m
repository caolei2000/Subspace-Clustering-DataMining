function [Z, Aff] = LRR(X, lambda)
%LRR 使用LRR(low rank representation进行子空间聚类)
% Input:
%       X: 数据, size(X)=d*n;
%       lambda: 算法正则化参数;
% Output:
%       Z: 得到的表示矩阵;
%       Aff：LRR得到的亲和矩阵；


[Z,~] = solve_lrr(X, lambda);  % 调用solve_lrr()
Aff = get_Aff_LRR(Z);  % 获得邻接矩阵

end

