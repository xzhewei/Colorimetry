%
%   test CQS by 4000K RGBA-LED
%

% B,DS4,DS3,DS2,DS1,NE,S1,S2,S3,S4
bdspd = importdata('data\source\BroadBand4000K.txt');
ds4spd = importdata('data\source\LED\RGBA-LED_DS4_4000K.txt');
ds3spd = importdata('data\source\LED\RGBA-LED_DS3_4000K.txt');
ds2spd = importdata('data\source\LED\RGBA-LED_DS2_4000K.txt');
ds1spd = importdata('data\source\LED\RGBA-LED_DS1_4000K.txt');
nespd = importdata('data\source\LED\RGBA-LED_NE_4000K.txt');
s1spd = importdata('data\source\LED\RGBA-LED_S1_4000K.txt');
s2spd = importdata('data\source\LED\RGBA-LED_S2_4000K.txt');
s3spd = importdata('data\source\LED\RGBA-LED_S3_4000K.txt');
s4spd = importdata('data\source\LED\RGBA-LED_S4_4000K.txt');

cqs = zeros(10,1);

tcs = readCQSTCS();

cqs(1) = spd2cqs(bdspd,tcs);
cqs(2) = spd2cqs(ds4spd,tcs);
cqs(3) = spd2cqs(ds3spd,tcs);
cqs(4) = spd2cqs(ds2spd,tcs);
cqs(5) = spd2cqs(ds1spd,tcs);
cqs(6) = spd2cqs(nespd,tcs);
cqs(7) = spd2cqs(s1spd,tcs);
cqs(8) = spd2cqs(s2spd,tcs);
cqs(9) = spd2cqs(s3spd,tcs);
cqs(10) = spd2cqs(s4spd,tcs);

CQS = [97,69,76,82,88,93,92,90,86,83]';
diff = CQS - cqs;
percentdiff = abs(diff)./CQS.*100;
disp(percentdiff);
disp(mean(percentdiff));
