function [X,Y,Z] = spd2xyz(spd,k,type)
% [X,Y,Z] = countXYZ(this,spd[,k,type])
%   spd是光谱数据spd(:,1)为波长，spd(:,2)为功率
%   type是锥响应曲线类型，type：2|10
%   k是Y归100化系数，如果已经计算得到可以输入，提高性能

switch nargin
    case 1
        k = 0;
        type = 2;
    case 2
        type = 2;
end
coneResp = coneRespType(type);

spd = spdNorm(spd);
[~,range1,range2] = intersect(spd(:,1),coneResp.Wavelength);
spd = spd(range1,:);
x = coneResp.X(range2);
y = coneResp.Y(range2);
z = coneResp.Z(range2);
if k == 0
    k = 100/sum(spd(:,2).*y);
end
X = k*sum(spd(:,2).*x);
Y = k*sum(spd(:,2).*y);
Z = k*sum(spd(:,2).*z);
end