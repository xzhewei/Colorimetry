function[W,U,V] = uv2wuv(Y,ui,vi,ur,vr)
%ur，vr为照明光源的色品坐标
%列1为明度指数W
if isvector(Y) && isvector(ui) && isvector(vi) && isvector(ur) && isvector(vr)
    W = 25.*Y.^(1/3) - 17;
    %列2，3为色品指数UV
    U = 13.*W.*(ui-ur);
    V = 13.*W.*(vi-vr);
else
    error('Input must all vector.');
end
end