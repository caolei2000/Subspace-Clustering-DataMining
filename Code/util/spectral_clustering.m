function [idx, center, kerNS] = spectral_clustering(sM, k)
%SpectralClustering 
% �������ƶȾ����׺�������\�ڽӾ��󣩣������׾���. һ���׾���, ����Ĭ�Ͻ�����20��kmeans.
% Input:
%       sM: ���ƶȾ���size(sM)=n*n;
%       k: �������;
% Output:
%       idx: ÿ�����������Ĵ�����,������������,��1��ʼ, size(idx)=1*n;
%       center: ÿ���ص����ĵ�����, size(center)=k*k;
%       kerNS: ���δ����kmeans���׾���õ���ָʾ����, size(kerNS)=n*k;

warning('off');
MAX_ITER = 1000;
REPLIC = 20;
n = size(sM,1);  % ������

dM = diag( 1./sqrt(sum(sM)+eps) );  % �Ⱦ���
lapM = speye(n) - dM * sM * dM;  % �Գƹ�һ�����������˹����
[~,~,v] = svd(lapM);
kerN = v(:,n-k+1:n);  % ѡ��С��k������ֵ��Ӧ����������
normN = sum(kerN .^2, 2) .^.5;
kerNS = bsxfun(@rdivide, kerN, normN + eps);  % ���䰴�б�׼��, �õ�ָʾ��������,size(kerNS)=n*k.
[idx, center] = kmeans(kerNS, k, 'MaxIter', MAX_ITER, 'Replicates', REPLIC);
idx = idx';
end

