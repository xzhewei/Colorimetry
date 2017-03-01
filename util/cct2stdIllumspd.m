function [spd,status] = cct2stdIllumspd(cct)
if cct>0 && cct<25000
    if cct < 5000
        spd = blackSPD(cct);
    else
        spd = illumDspd(cct);
    end
    status = 0; %标准光源生成
else
    spd = [];
    status = -1; %cct超出标准光源的色温范围
end
end