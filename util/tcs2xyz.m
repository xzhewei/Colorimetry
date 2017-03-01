function [Xi,Yi,Zi] = tcs2xyz(spd,tcs,type)
if nargin == 2
    type = 2;
end
spd = spdNorm(spd);
if isstruct(tcs)
    wl = tcs.Wavelength;
    tcsr = tcs.TCSR;
else
    wl = tcs(:,1);
    tcsr = tcs(:,2:end);
end

num = size(tcsr,2);
Xi = zeros(num,1);
Yi = zeros(num,1);
Zi = zeros(num,1);
[~,rng1,rng2] = intersect(spd(:,1),wl);
spd = spd(rng1,:);
tcsr = tcsr(rng2,:);
wl = wl(rng2);
k = spd2k(spd);
for i = 1:num
    [Xi(i),Yi(i),Zi(i)] = spd2xyz([wl,spd(:,2).*tcsr(:,i)],k,type);
end
end