function XYZic = catCMCC2000(Xit,Yit,Zit,Xwr,Ywr,Zwr,Xwt,Ywt,Zwt)
%   @fun: CQS中采用的简化版CMCCAT2000色适应变换
%   @param: Xit,Yit,Zit为待测光源下的色样三刺激值
%           Xwt,Ywt,Zwt为待测光源的三刺激值
%           Xwr,Ywr,Zwr为目标光源的三刺激值

%色适应变换矩阵，将XYZ刺激值变化为RGB刺激值
CATMat = [ 0.7982,  0.3389, -0.1371;
          -0.5918,  1.5512,  0.0406;
           0.0008,  0.0239,  0.9753];

RGBitest = CATMat*[Xit,Yit,Zit]'; %RGBitest为3X15矩阵待测光源下的样品矩阵3X15
RGBwref = CATMat*[Xwr;Ywr;Zwr];  %RGBwref为3X1矩阵参考光远的白RGB刺激
RGBwtest = CATMat*[Xwt;Ywt;Zwt]; %RGBwtest为3X1矩阵待测光源的白RGB刺激
a = Ywt/Ywr;

%变化为适应后的RGB刺激
RGBitestc(1,:) = RGBitest(1,:).*a.*(RGBwref(1)/RGBwtest(1));
RGBitestc(2,:) = RGBitest(2,:).*a.*(RGBwref(2)/RGBwtest(2));
RGBitestc(3,:) = RGBitest(3,:).*a.*(RGBwref(3)/RGBwtest(3));

%反向变换时使用的色适应变换逆矩阵
invCATMat = [ 1.076450, -0.237662, 0.161212;
              0.410964,  0.554342, 0.034694;
             -0.010954, -0.013389, 1.024343];

%变化为参考光源下的XYZ刺激
XYZic = invCATMat*RGBitestc;
XYZic = XYZic';
end