A = readStdIllum('CIE_A');
B = readStdIllum('CIE_B');
C = readStdIllum('CIE_C');
D50 = readStdIllum('CIE_D50');
D55 = readStdIllum('CIE_D55');
D65 = readStdIllum('CIE_D65');
D75 = readStdIllum('CIE_D75');
CIEStdFluSPD;
stdcct = zeros(19,1);
stdcct(1) = A.CCT;
stdcct(2) = B.CCT;
stdcct(3) = C.CCT;
stdcct(4) = D50.CCT;
stdcct(5) = D55.CCT;
stdcct(6) = D65.CCT;
stdcct(7) = D75.CCT;
stdcct(8:end) = cct';

realcct = zeros(19,1);
realcct(1) = spd2cct(A.SPD);
realcct(2) = spd2cct(B.SPD);
realcct(3) = spd2cct(C.SPD);
realcct(4) = spd2cct(D50.SPD);
realcct(5) = spd2cct(D55.SPD);
realcct(6) = spd2cct(D65.SPD);
realcct(7) = spd2cct(D75.SPD);
for i = 1:12
    realcct(7+i) = spd2cct([wl',fspd(:,i)]);
end
plot(stdcct,realcct-stdcct,'*');
realcct = round(realcct*100)/100;