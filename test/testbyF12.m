%使用CIE 12个标准荧光灯的光谱和色度参数验证工具包的正确性
%dxy 色坐标计算误差
%dcct相关色温计算误差
%dra 显色指数计算误差
clear all

CIEStdFluSPD;

txy = zeros(2,12);
tcct = zeros(1,12);
tcri = zeros(15,12);
tra = zeros(1,12);
ra15 = zeros(1,12);
tqa = zeros(1,12);
rinist = zeros(15,12);
ranist = zeros(1,12);
rimcc = zeros(24,12);
ramcc = zeros(1,12);
tcscri = testColorSample('cri');
tcsnist = testColorSample('nist');
tcsmcc = testColorSample('mcc');
for i = 1:12
    spd = [wl',fspd(:,i)];
    [X,Y,Z] = spd2xyz(spd);
    [x,y] = xyz2xy(X,Y,Z);
    txy(:,i) = [x;y];
    tcct(i) = xy2cct(x,y);
    tcri(:,i) = spd2cri(spd);
    tra(i) = sum(tcri(1:8,i))/8;
    tqa(i) = spd2cqs(spd);
    [ranist(i),rinist(:,i),~] = spd2AdjustCRI(spd,tcsnist,2.89);
    [ramcc(i),rimcc(:,i),~] = spd2AdjustCRI(spd,tcsmcc,4);
end
factor = 2:0.1:5;
n = numel(factor);
dmeancie15 = zeros(1,n);
for j = 1:n
    for i = 1:12
        spd = [wl',fspd(:,i)];
        ra15(i) = spd2AdjustCRI(spd,tcscri,factor(j));
    end
    dmeancie15(j) = abs(mean(ra-ra15));
end
factor = 2:0.1:5;
n = numel(factor);
dmeannist = zeros(1,n);
for j = 1:n
    for i = 1:12
    spd = [wl',fspd(:,i)];  
    [ranist(i),rinist(:,i),~] = spd2AdjustCRI(spd,tcsnist,factor(j));
    end
    dmeannist(j) = abs(mean(ra-ranist));
end
% 
factor = 2:0.1:5;
n = numel(factor);
dmeanmcc = zeros(1,n);
for j = 1:n
    for i = 1:12
    spd = [wl',fspd(:,i)];  
    [ramcc(i),rimcc(:,i),~] = spd2AdjustCRI(spd,tcsmcc,factor(j));
    end
    dmeanmcc(j) = abs(mean(ra-ramcc));
end

dxy = txy - xy;
dcct = tcct - cct;
dra = tra - ra;