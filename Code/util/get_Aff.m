function [Aff] = get_Aff(Z,X,aff_type,gamma)
%GET_AFF 从表示矩阵Z得到亲和矩阵A的三种方式
%Input：
%       Z：表示矩阵；
%       X：数据矩阵；
%       aff_type：获得亲和矩阵的方式，有'J1'、'J2'、'J2_nonorm'；
%       gamma：其中的参数；
%Output：
%       Aff：亲和矩阵；

nX = sqrt(sum(X.^2));

if strcmp(aff_type,'J1')
    Aff =(abs(Z)+abs(Z'))/2;
elseif strcmp(aff_type,'J2')
    Aff = abs(Z'*Z./(nX'*nX)).^gamma;
elseif strcmp(aff_type,'J2_nonorm')
    Aff = abs(Z'*Z).^gamma;
end

end

