function [Z, Aff] = LRR(X, lambda)
%LRR ʹ��LRR(low rank representation�����ӿռ����)
% Input:
%       X: ����, size(X)=d*n;
%       lambda: �㷨���򻯲���;
% Output:
%       Z: �õ��ı�ʾ����;
%       Aff��LRR�õ����׺;���


[Z,~] = solve_lrr(X, lambda);  % ����solve_lrr()
Aff = get_Aff_LRR(Z);  % ����ڽӾ���

end

