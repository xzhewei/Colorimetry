function [uic,vic] = catVonKries(uk,vk,ur,vr,ut,vt)
%ʵ�ζ���������
%ur,vr�ǲο���Դ��Ϊ��Դʱ��ɫ��ɫƷ����
%uk,vk�Ǵ����Դ��Ϊ��Դʱ��ɫ��ɫƷ����

Cr = (1/vr)*(4-ur-10.*vr);
Dr = (1/vr)*(1.708*vr+0.404-1.481*ur);
Ck = (1/vt)*(4-ut-10*vt);
Dk = (1/vt)*(1.708*vt+0.404-1.481*ut);

Cki = (1./vk).*(4-uk-10.*vk);
Dki = (1./vk).*(1.708.*vk+0.404-1.481.*uk);

%ɫ��Ӧ����
uic = (10.872+0.404.*Cr.*Cki./Ck-4.*Dr.*Dki./Dk)./...
    (16.518+1.481.*Cr.*Cki./Ck-Dr.*Dki./Dk);
vic = 5.520./(16.518+1.481.*Cr.*Cki./Ck-Dr.*Dki./Dk);
end