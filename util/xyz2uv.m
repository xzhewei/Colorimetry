function [u,v] = xyz2uv(X,Y,Z)
%   根据CIE XYZ色空间下的三刺激值计算 uv色品图上的色坐标
if isvector(X) && isvector(Y) && isvector(Z)
    u = 4.*X./(X + 15.*Y + 3.*Z);
    v = 6.*Y./(X + 15.*Y + 3.*Z);
else
    error('Input must all vector.');
end
end