function plum = photopicLum(spd)
% plum = countPhotopicLum(this,spd)
%   ���׹���ת��Ϊ����
spd = spdNorm(spd);
% persistent visualFun
% if isempty(visualFun)
    cone = coneRespType(2);
    visualFun = [cone.Wavelength,cone.Y];
% end
tspd = interp(spd(:,1),spd(:,2),visualFun(:,1));
tspd(isnan(tspd)) = 0.0;
plum = 683*tspd*visualFun(:,2);    %683lm/W�Ĺ⹦����
end