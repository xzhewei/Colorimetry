clear all

bdspd = importdata('data\source\BroadBand4000K.txt');
spdrgba(:,:,1) = importdata('data\source\LED\RGBA-LED_DS4_4000K.txt');
spdrgba(:,:,2) = importdata('data\source\LED\RGBA-LED_DS3_4000K.txt');
spdrgba(:,:,3) = importdata('data\source\LED\RGBA-LED_DS2_4000K.txt');
spdrgba(:,:,4) = importdata('data\source\LED\RGBA-LED_DS1_4000K.txt');
spdrgba(:,:,5) = importdata('data\source\LED\RGBA-LED_NE_4000K.txt');
spdrgba(:,:,6) = importdata('data\source\LED\RGBA-LED_S1_4000K.txt');
spdrgba(:,:,7) = importdata('data\source\LED\RGBA-LED_S2_4000K.txt');
spdrgba(:,:,8) = importdata('data\source\LED\RGBA-LED_S3_4000K.txt');
spdrgba(:,:,9) = importdata('data\source\LED\RGBA-LED_S4_4000K.txt');

snum = 9;
xy = zeros(2,snum);
uv = zeros(2,snum);
duv = zeros(1,snum);
cct = zeros(1,snum);
ricie = zeros(15,snum);
ra8 = zeros(1,snum);
ra15 = zeros(1,snum);
rinist = zeros(15,snum);
ranist = zeros(1,snum);
rimcc = zeros(24,snum);
ramcc = zeros(1,snum);
qi = zeros(15,snum);
qa = zeros(1,snum);
qf = zeros(1,snum);
qp = zeros(1,snum);
qg = zeros(1,snum);
gai = zeros(1,snum);
fsci = zeros(1,snum);
gainist = zeros(1,snum);
gainistd65 = zeros(1,snum);
tcscri = testColorSample('cri');
tcsnist = testColorSample('nist');
tcsmcc = testColorSample('mcc');
for i = 1:9
    spd = spdrgba(:,:,i);
    [X,Y,Z] = spd2xyz(spd);
    [x,y] = xyz2xy(X,Y,Z);
    xy(:,i) = [x;y];
    cct(i) = xy2cct(x,y);
    duv(i) = xy2duv(x,y);
    [ra8(i),ricie(:,i),~] = spd2cri(spd,tcscri);
    ra15(i) = round(sum(ricie(:,i))/15*10)/10;
    [qa(i),qf(i),qp(i),qg(i),qi(:,i),~] = spd2cqs(spd,tcsnist);
    gai(i) = spd2gai(spd);
    [ranist(i),rinist(:,i),~] = spd2AdjustCRI(spd,tcsnist,2.89);
    [ramcc(i),rimcc(:,i),~] = spd2AdjustCRI(spd,tcsmcc,4);
    fsci(i) = spd2fsci(spd);
    gainist(i) = spd2gai(spd,tcsnist);
    gainistd65(i) = spd2gai(spd,tcsnist,cct2stdIllumspd(6500));
end
    