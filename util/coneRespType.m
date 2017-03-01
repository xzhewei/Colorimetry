function coneResp = coneRespType(type)
% 选择锥响应类型
%  type：2|10
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
        error('参数type只能是2或10');
end
end