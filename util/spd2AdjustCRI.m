function [Ra,Ri,status] = spd2AdjustCRI(spd,tcs,factor)
if nargin == 1
    tcs = testColorSample('cri');
end
spd = spdNorm(spd);
%ͨ����Ϲ��׵�cct�õ���׼��Դ��SPD
[Xtx,Ytx,Ztx] = spd2xyz(spd);
[xt,yt] = xyz2xy(Xtx,Ytx,Ztx);
cct = xy2cct(xt,yt);
refspd = cct2stdIllumspd(cct);
if isempty(refspd)
    Ra = 0;
    Ri = zeros(size(tcs,2),1);
    status = -1;
    return;
end

%ͨ�����׼����ڴ˹�Դ�����¹�Դ�͸���ɫ��Ʒ��Yuv
[Xrx,Yrx,Zrx] = spd2xyz(refspd);
[urx,vrx] = xyz2uv(Xrx,Yrx,Zrx);

[Xrix,Yrix,Zrix] = tcs2xyz(refspd,tcs);
[urix,vrix] = xyz2uv(Xrix,Yrix,Zrix);

[utx,vtx] = xyz2uv(Xtx,Ytx,Ztx);

[Xtix,Ytix,Ztix] = tcs2xyz(spd,tcs);
[utix,vtix] = xyz2uv(Xtix,Ytix,Ztix);

%���������׵�ɫ��Ӧ������
[uticx,vticx] = catVonKries(utix,vtix,urx,vrx,utx,vtx);

%����CIE1964�е�WUV
[Wrx,Urx,Vrx] = uv2wuv(Yrix,urix,vrix,urx,vrx);
[Wtx,Utx,Vtx] = uv2wuv(Ytix,uticx,vticx,urx,vrx);

%����CIE1964 WUV��ɫ��
colorDiffx = colordiffwuv(Wrx,Urx,Vrx,Wtx,Utx,Vtx);

%����ɫָ��
Ri = 100 - factor.*colorDiffx;
Ra = round(sum(Ri(1:8))/8*10)/10;
status = 0;
end