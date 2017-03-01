function [spd,status] = illumDspd(cct)
persistent stdIllumDParam
if isempty(stdIllumDParam)
    stdIllumDParam = readStdIllumDParam();
end
if cct < 4000 || cct > 25000
    spd = [];
    status = -1;
    return;
else
    if cct > 7000
        xd = 0.237040 + 0.24748*10^3/cct + 1.9018*10^6/cct^2 - 2.0064*10^9/cct^3;
    else
        xd = 0.244063 + 0.09911*10^3/cct + 2.9678*10^6/cct^2 - 4.6070*10^9/cct^3;
    end
end
yd = -3*xd^2 + 2.870*xd - 0.275;
M = 0.0241 + 0.2562*xd - 0.7341*yd;
% 两个特征根
M1 = (-1.3515 - 1.7703*xd + 5.9114*yd)/M;
M2 = (0.03 - 31.4424*xd + 30.0717*yd)/M;
spd = zeros(numel(stdIllumDParam.Wavelength),2);
spd(:,1) = stdIllumDParam.Wavelength;
spd(:,2) = stdIllumDParam.S0 + M1.*stdIllumDParam.S1...
    + M2.*stdIllumDParam.S2;

status = 0;
end