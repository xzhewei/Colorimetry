%
%   将XYZ三刺激值转换到LAB色空间
%   @param Xi,Yi,Zi三刺激值 Xw,Yw,Zw光源三刺激值
%
function [L,A,B] = xyz2lab(Xi,Yi,Zi,Xw,Yw,Zw)
    %L,为明度标尺 [0,100]
    L = 116.*fun(Yi,Yw) - 16;
    %A 为红绿对色标尺 [-120,120] 正红，负绿
    A = 500.*(fun(Xi,Xw) - fun(Yi,Yw));
    %B 为黄蓝对色标尺 [-120,120] 正蓝，负黄
    B = 200.*(fun(Yi,Yw) - fun(Zi,Zw));
    
    %根据XYZtoLAB的转换公式，X/Xn = (24/116)^(1/3)两边的计算方法不同
    function value = fun(X,Xn)
        value = zeros(size(X));
        limit = (24/116)^3;
        t = X./Xn;
        flag = t > limit;
        value(flag) = t(flag).^(1/3);
        value(~flag) = (841/108).*t(~flag)+16/116;
    end
end