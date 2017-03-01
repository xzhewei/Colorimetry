function [u,v] = xyz2uv(X,Y,Z)
%   ����CIE XYZɫ�ռ��µ����̼�ֵ���� uvɫƷͼ�ϵ�ɫ����
if isvector(X) && isvector(Y) && isvector(Z)
    u = 4.*X./(X + 15.*Y + 3.*Z);
    v = 6.*Y./(X + 15.*Y + 3.*Z);
else
    error('Input must all vector.');
end
end