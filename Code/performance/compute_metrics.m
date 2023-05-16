function [ca, nmi, ar, f1, p, r] = compute_metrics(gnd, idx)
%COMPUTEMETRICS 
% ����Ԥ��������������Լ�ground truth����ָ��
% Input:
%       gnd: ground truth, size(gnd)=n*1;
%       idx: �㷨�õ��ľ���������, size(idx)=n*1;
%       (����������size����1*n)
% Output:
%       ca: ���ྫ��;
%       nmi: ��һ������Ϣ;
%       ar: ��������ָ��;
%       f1: F1 score;
%       p: precision;
%       r: recall;

warning('off');
if (min(gnd)==0)
    gnd = gnd+1;
end

% �������ָ��, ��������ĺ���ûȥ�
ca = 1 - compute_ce(gnd,idx);
nmi = compute_nmi(gnd,idx);
ar = compute_rand_index(gnd,idx);
[f1, p, r] = compute_f(gnd,idx);

end

