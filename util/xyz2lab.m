%
%   ��XYZ���̼�ֵת����LABɫ�ռ�
%   @param Xi,Yi,Zi���̼�ֵ Xw,Yw,Zw��Դ���̼�ֵ
%
function [L,A,B] = xyz2lab(Xi,Yi,Zi,Xw,Yw,Zw)
    %L,Ϊ���ȱ�� [0,100]
    L = 116.*fun(Yi,Yw) - 16;
    %A Ϊ���̶�ɫ��� [-120,120] ���죬����
    A = 500.*(fun(Xi,Xw) - fun(Yi,Yw));
    %B Ϊ������ɫ��� [-120,120] ����������
    B = 200.*(fun(Yi,Yw) - fun(Zi,Zw));
    
    %����XYZtoLAB��ת����ʽ��X/Xn = (24/116)^(1/3)���ߵļ��㷽����ͬ
    function value = fun(X,Xn)
        value = zeros(size(X));
        limit = (24/116)^3;
        t = X./Xn;
        flag = t > limit;
        value(flag) = t(flag).^(1/3);
        value(~flag) = (841/108).*t(~flag)+16/116;
    end
end