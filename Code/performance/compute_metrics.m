function [ca, nmi, ar, f1, p, r] = compute_metrics(gnd, idx)
%COMPUTEMETRICS 
% 根据预测的样本簇索引以及ground truth计算指标
% Input:
%       gnd: ground truth, size(gnd)=n*1;
%       idx: 算法得到的聚类结果索引, size(idx)=n*1;
%       (或者两个的size都是1*n)
% Output:
%       ca: 聚类精度;
%       nmi: 归一化互信息;
%       ar: 调整兰德指数;
%       f1: F1 score;
%       p: precision;
%       r: recall;

warning('off');
if (min(gnd)==0)
    gnd = gnd+1;
end

% 计算各个指标, 具体里面的函数没去深究
ca = 1 - compute_ce(gnd,idx);
nmi = compute_nmi(gnd,idx);
ar = compute_rand_index(gnd,idx);
[f1, p, r] = compute_f(gnd,idx);

end

