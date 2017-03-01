function XYZic = catCMCC2000(Xit,Yit,Zit,Xwr,Ywr,Zwr,Xwt,Ywt,Zwt)
%   @fun: CQS�в��õļ򻯰�CMCCAT2000ɫ��Ӧ�任
%   @param: Xit,Yit,ZitΪ�����Դ�µ�ɫ�����̼�ֵ
%           Xwt,Ywt,ZwtΪ�����Դ�����̼�ֵ
%           Xwr,Ywr,ZwrΪĿ���Դ�����̼�ֵ

%ɫ��Ӧ�任���󣬽�XYZ�̼�ֵ�仯ΪRGB�̼�ֵ
CATMat = [ 0.7982,  0.3389, -0.1371;
          -0.5918,  1.5512,  0.0406;
           0.0008,  0.0239,  0.9753];

RGBitest = CATMat*[Xit,Yit,Zit]'; %RGBitestΪ3X15��������Դ�µ���Ʒ����3X15
RGBwref = CATMat*[Xwr;Ywr;Zwr];  %RGBwrefΪ3X1����ο���Զ�İ�RGB�̼�
RGBwtest = CATMat*[Xwt;Ywt;Zwt]; %RGBwtestΪ3X1��������Դ�İ�RGB�̼�
a = Ywt/Ywr;

%�仯Ϊ��Ӧ���RGB�̼�
RGBitestc(1,:) = RGBitest(1,:).*a.*(RGBwref(1)/RGBwtest(1));
RGBitestc(2,:) = RGBitest(2,:).*a.*(RGBwref(2)/RGBwtest(2));
RGBitestc(3,:) = RGBitest(3,:).*a.*(RGBwref(3)/RGBwtest(3));

%����任ʱʹ�õ�ɫ��Ӧ�任�����
invCATMat = [ 1.076450, -0.237662, 0.161212;
              0.410964,  0.554342, 0.034694;
             -0.010954, -0.013389, 1.024343];

%�仯Ϊ�ο���Դ�µ�XYZ�̼�
XYZic = invCATMat*RGBitestc;
XYZic = XYZic';
end