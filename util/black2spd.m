function spd = blackBody(cct, w)
% �������ʿ˺������ļ��㹫ʽ����cctɫ�µĺ������

if(nargin == 1)
    w = (360:830)';
end

spd(:,1) = w;
spd(:,2) = 1./((spd(:,1).^5).*...
    (exp(14388000./(spd(:,1).*cct))-1));
spd(:,2) = spd(:,2)./sum(spd(:,2));

end