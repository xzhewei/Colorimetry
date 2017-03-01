%
%   获得range波长范围内的光谱分布
%
function ispd = spdIntersect(spd,range)
    spd = normSPD(spd);
    [~,~,m] = intersect(range,spd(:,1));
    ispd = spd(m,:);
end