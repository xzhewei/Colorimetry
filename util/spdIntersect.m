%
%   ���range������Χ�ڵĹ��׷ֲ�
%
function ispd = spdIntersect(spd,range)
    spd = normSPD(spd);
    [~,~,m] = intersect(range,spd(:,1));
    ispd = spd(m,:);
end