%生成1700到25000色温的标准光源光谱，然后计算其色坐标在计算色温，判断误差
%10000色温内的计算误差在10k以内
%dcct相关色温计算误差

clear all
cct = 1700:100:25000;
t = zeros(size(cct));
% cie = CIETool.getInstance();
i = 1;
for c = cct
%     spd = getBlackIllumSPD(c);
%     spd = cie.getStdIllumDSPD(c);
    if c < 4000
        spd = blackSPD(c);
    else
        spd = illumDspd(c);
    end
%     [x,y] = cie.countxy(spd);
    [X,Y,Z] = spd2xyz(spd);
    x = X+Y+Z;
    y = Y/x;
    x = X/x;
%     t(i) = cie.countCCT(x,y);
    t(i) = xy2cct(x,y);
    i = i + 1;
end
dcct = t-cct;