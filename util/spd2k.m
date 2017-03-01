function k = spd2k(spd)
coneResp = coneRespType(2);
spd = spdNorm(spd);
[~,range1,range2] = intersect(spd(:,1),coneResp.Wavelength);
spd = spd(range1,:);
y = coneResp.Y(range2);
k = 100/sum(spd(:,2).*y);
end