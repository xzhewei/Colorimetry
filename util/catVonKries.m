function [uic,vic] = catVonKries(uk,vk,ur,vr,ut,vt)
%实参都是列向量
%ur,vr是参考光源作为光源时的色块色品坐标
%uk,vk是待测光源作为光源时的色块色品坐标

Cr = (1/vr)*(4-ur-10.*vr);
Dr = (1/vr)*(1.708*vr+0.404-1.481*ur);
Ck = (1/vt)*(4-ut-10*vt);
Dk = (1/vt)*(1.708*vt+0.404-1.481*ut);

Cki = (1./vk).*(4-uk-10.*vk);
Dki = (1./vk).*(1.708.*vk+0.404-1.481.*uk);

%色适应修正
uic = (10.872+0.404.*Cr.*Cki./Ck-4.*Dr.*Dki./Dk)./...
    (16.518+1.481.*Cr.*Cki./Ck-Dr.*Dki./Dk);
vic = 5.520./(16.518+1.481.*Cr.*Cki./Ck-Dr.*Dki./Dk);
end