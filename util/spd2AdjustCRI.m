function [Ra,Ri,status] = spd2AdjustCRI(spd,tcs,factor)
if nargin == 1
    tcs = testColorSample('cri');
end
spd = spdNorm(spd);
%通过混合光谱的cct得到标准光源的SPD
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

%通过光谱计算在此光源照明下光源和各颜色样品的Yuv
[Xrx,Yrx,Zrx] = spd2xyz(refspd);
[urx,vrx] = xyz2uv(Xrx,Yrx,Zrx);

[Xrix,Yrix,Zrix] = tcs2xyz(refspd,tcs);
[urix,vrix] = xyz2uv(Xrix,Yrix,Zrix);

[utx,vtx] = xyz2uv(Xtx,Ytx,Ztx);

[Xtix,Ytix,Ztix] = tcs2xyz(spd,tcs);
[utix,vtix] = xyz2uv(Xtix,Ytix,Ztix);

%计算待测光谱的色适应性修正
[uticx,vticx] = catVonKries(utix,vtix,urx,vrx,utx,vtx);

%计算CIE1964中的WUV
[Wrx,Urx,Vrx] = uv2wuv(Yrix,urix,vrix,urx,vrx);
[Wtx,Utx,Vtx] = uv2wuv(Ytix,uticx,vticx,urx,vrx);

%计算CIE1964 WUV的色差
colorDiffx = colordiffwuv(Wrx,Urx,Vrx,Wtx,Utx,Vtx);

%求显色指数
Ri = 100 - factor.*colorDiffx;
Ra = round(sum(Ri(1:8))/8*10)/10;
status = 0;
end