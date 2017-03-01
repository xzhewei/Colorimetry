function [X,Y,Z] = spd2xyz(spd,k,type)
% [X,Y,Z] = countXYZ(this,spd[,k,type])
%   spd�ǹ�������spd(:,1)Ϊ������spd(:,2)Ϊ����
%   type��׶��Ӧ�������ͣ�type��2|10
%   k��Y��100��ϵ��������Ѿ�����õ��������룬�������

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