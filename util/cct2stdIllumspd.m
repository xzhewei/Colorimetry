function [spd,status] = cct2stdIllumspd(cct)
if cct>0 && cct<25000
    if cct < 5000
        spd = blackSPD(cct);
    else
        spd = illumDspd(cct);
    end
    status = 0; %��׼��Դ����
else
    spd = [];
    status = -1; %cct������׼��Դ��ɫ�·�Χ
end
end