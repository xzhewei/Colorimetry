%����1700��25000ɫ�µı�׼��Դ���ף�Ȼ�������ɫ�����ڼ���ɫ�£��ж����
%10000ɫ���ڵļ��������10k����
%dcct���ɫ�¼������

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