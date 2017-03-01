function gai = spd2gai(spd,tcs,refspd)
switch nargin
    case 1
        tcs = testColorSample('cri');
        tcs.TCSR(:,9:end)=[];
        tcs.Name(:,9:end)=[];
        tcs.Munsell(:,9:end)=[];
        tcs.Wavelength(:,9:end)=[];
        wave = 360:830;
        refspd = ones(size(wave));
        refspd = [wave',refspd'];
    case 2
        wave = 360:830;
        refspd = ones(size(wave));
        refspd = [wave',refspd'];
end
spd = spdNorm(spd);
[~,rng1,rng2] = intersect(refspd(:,1),spd(:,1));%������ͬ�Ĳ�����Χ
refspd = refspd(rng1,:);
spd = spd(rng2,:);

%�����ڴ����Դ�µ�ɫ��uv����
[Xit,Yit,Zit] = tcs2xyz(spd,tcs);
uit = 4.*Xit./(Xit + 15.*Yit + 3.*Zit);
vit = 9.*Yit./(Xit + 15.*Yit + 3.*Zit);
uit = [uit;uit(1)];
vit = [vit;vit(1)];
%����ɫ����Χ����ε����
gamut = polyarea(uit,vit);

%����ο����ܰ׹��ɫ�����
%�����ڲο���Դ�µ�ɫ��uv����
[Xir,Yir,Zir] = tcs2xyz(refspd,tcs);
uir = 4.*Xir./(Xir + 15.*Yir + 3.*Zir);
vir = 9.*Yir./(Xir + 15.*Yir + 3.*Zir);
uir = [uir;uir(1)];
vir = [vir;vir(1)];
Qd = polyarea(uir,vir);

%test
%     plot(utii,vtii,'r*',utii,vtii,'r');
%     hold on;
%     plot(urii,vrii,'b*',urii,vrii,'b');

%�Ե��ܰ׹�Ϊ��׼������ɫ��ָ����
gai = gamut/Qd*100;
end