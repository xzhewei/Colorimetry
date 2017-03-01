function[W,U,V] = uv2wuv(Y,ui,vi,ur,vr)
%ur��vrΪ������Դ��ɫƷ����
%��1Ϊ����ָ��W
if isvector(Y) && isvector(ui) && isvector(vi) && isvector(ur) && isvector(vr)
    W = 25.*Y.^(1/3) - 17;
    %��2��3ΪɫƷָ��UV
    U = 13.*W.*(ui-ur);
    V = 13.*W.*(vi-vr);
else
    error('Input must all vector.');
end
end