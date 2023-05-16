function [A] = get_Aff_LRR(Z)
% LRR�㷨��һ��"�ɱ�ʾ����õ��ڽӾ���"�ķ���
% Input:
%       Z: ��ʾ����;
% Output:
%       A: �ڽӾ���(���ƾ���);

[U,S,~] = svd(Z,'econ'); 
S = diag(S);
r = sum(S>1e-4*S(1));
U = U(:,1:r);S = S(1:r);
U = U*diag(sqrt(S));
U = normr(U);
A = (U*U').^4; % ���������ʣ�������д�ú���ƽ����(����ط�2\4, ���ݲ�ͬ�����ݼ��в�ͬ��Ч��)

end

