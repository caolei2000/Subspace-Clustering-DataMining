function [idx, center, kerNS] = spectral_clustering(sM, k)
%SpectralClustering 
% 输入相似度矩阵（亲和力矩阵\邻接矩阵），进行谱聚类. 一次谱聚类, 里面默认进行了20次kmeans.
% Input:
%       sM: 相似度矩阵，size(sM)=n*n;
%       k: 聚类簇数;
% Output:
%       idx: 每个样本归属的簇索引,即聚类结果索引,从1开始, size(idx)=1*n;
%       center: 每个簇的中心点坐标, size(center)=k*k;
%       kerNS: 最后未进行kmeans的谱聚类得到的指示矩阵, size(kerNS)=n*k;

warning('off');
MAX_ITER = 1000;
REPLIC = 20;
n = size(sM,1);  % 样本数

dM = diag( 1./sqrt(sum(sM)+eps) );  % 度矩阵
lapM = speye(n) - dM * sM * dM;  % 对称归一化后的拉普拉斯矩阵
[~,~,v] = svd(lapM);
kerN = v(:,n-k+1:n);  % 选最小的k个特征值对应的特征向量
normN = sum(kerN .^2, 2) .^.5;
kerNS = bsxfun(@rdivide, kerN, normN + eps);  % 对其按行标准化, 得到指示向量矩阵,size(kerNS)=n*k.
[idx, center] = kmeans(kerNS, k, 'MaxIter', MAX_ITER, 'Replicates', REPLIC);
idx = idx';
end

