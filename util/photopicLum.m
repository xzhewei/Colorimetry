function plum = photopicLum(spd)
% plum = countPhotopicLum(this,spd)
%   光谱功率转换为流明
spd = spdNorm(spd);
% persistent visualFun
% if isempty(visualFun)
    cone = coneRespType(2);
    visualFun = [cone.Wavelength,cone.Y];
% end
tspd = interp(spd(:,1),spd(:,2),visualFun(:,1));
tspd(isnan(tspd)) = 0.0;
plum = 683*tspd*visualFun(:,2);    %683lm/W的光功当量
end