function [Qa,Qf,Qp,Qg,Qi,status] = spd2cqs(spd,tcs)
if nargin == 1
    tcs = testColorSample('nist');
end
spd = spdNorm(spd);
[Xwt,Ywt,Zwt] = spd2xyz(spd);
[xt,yt] = xyz2xy(Xwt,Ywt,Zwt);
cct = xy2cct(xt,yt);
refspd = cct2stdIllumspd(cct);

if isempty(refspd)
    Qa = 0;
    Qf = 0;
    Qp = 0;
    Qg = 0;
    status = -1;
    return;
end

%通过光谱计算在此光源照明下光源和各颜色样品的
[Xwr,Ywr,Zwr] = spd2xyz(refspd);
[Xir,Yir,Zir] = tcs2xyz(refspd,tcs);
[Xit,Yit,Zit] = tcs2xyz(spd,tcs);

XYZitc = catCMCC2000(Xit,Yit,Zit,Xwr,Ywr,Zwr,Xwt,Ywt,Zwt);

[Lir, Air, Bir] = xyz2lab(Xir,Yir,Zir,Xwr,Ywr,Zwr);
[Lit, Ait, Bit] = xyz2lab(XYZitc(:,1),XYZitc(:,2),XYZitc(:,3),Xwt,Ywt,Zwt);

Cir = lab2C(Air,Bir);
Cit = lab2C(Ait,Bit);
DC = Cit - Cir;

dei = colordifflab(Lir,Air,Bir,Lit,Ait,Bit);

%计算CCT因子，即在色温过低时，引入折扣光源的概念
if cct < 3500
    MCCT = 9.2672*10^-11*cct^3 - 8.3959*10^-7*cct^2 + 0.00255*cct - 1.612;
else
    MCCT = 1;
end

deisat = zeros(size(dei));
flag = DC > 0;
deisat(~flag) = dei(~flag);
deisat(flag) = sqrt(dei(flag).^2 - DC(flag).^2);

%% Qi
Qi = 100 - 3.1.*deisat;
Qi = 10.*log(exp(Qi/10)+1);
Qi = MCCT.*Qi;

%% Qa
dearms = sqrt(mean(deisat.^2));
Qa = 100 - 3.1*dearms;
Qa = 10.*log(exp(Qa/10)+1);
Qa = MCCT.*Qa;

%% Qf
defrms = sqrt(mean(dei.^2));
Qf = 100 - 3.1*defrms;
Qf = 10*log(exp(Qf/10)+1);
Qf = MCCT.*Qf;

%% Qp
deprms = dearms - sum(DC(flag))/numel(DC);
Qp = 100 - 3.78*deprms;
Qp = 10*log(exp(Qp/10)+1);
Qp = MCCT.*Qp;

%% Qg
[~,Agi,Bgi] = xyz2lab(Xit,Yit,Zit,Xwt,Ywt,Zwt);
Agi = [Agi;Agi(1)];
Bgi = [Bgi;Bgi(1)];
gamut = polyarea(Agi,Bgi);

spd65 = illumDspd(6500);
[Xw65,Yw65,Zw65] = spd2xyz(spd65);
[Xi65,Yi65,Zi65] = tcs2xyz(spd65,tcs);
[~,A65,B65] = xyz2lab(Xi65,Yi65,Zi65,Xw65,Yw65,Zw65);
A65 = [A65;A65(1)];
B65 = [B65;B65(1)];
gamut65 = polyarea(A65,B65);

Qg = gamut/gamut65*100;
status = 0;
end