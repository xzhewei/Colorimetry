function coneResp = coneRespType(type)
% ѡ��׶��Ӧ����
%  type��2|10
persistent consResp2D consResp10D
switch type
    case 2
        if isempty(consResp2D)
            consResp2D = readConeResp('cie_std2');
        end
        coneResp = consResp2D;
    case 10
        if isempty(consResp10D)
            consResp10D = readConeResp('cie_std10');
        end
        coneResp = consResp10D;
    otherwise
        error('����typeֻ����2��10');
end
end