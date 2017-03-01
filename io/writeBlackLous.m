function writeBlackLous(lous)
    % lous 是个struct
    %   Space 黑体轨迹所在的色空间
    %   Coord 黑体轨迹
    %   CCT   黑体轨迹对应的色温
    toTxt(lous);
end
function toTxt(lous)
    filename = [lous.Space '_BlackLous'];
    filename = [filename '.txt'];
    fid = fopen(filename,'w');
    fprintf(fid,['#ColorSpace ' lous.Space '\n']);
    fprintf(fid,'#Coord1_Coord2_CCT\n');
    data = [lous.Coord,lous.CCT];
    fprintf(fid,'%.6f %.6f %.1f\n',data');
    fclose(fid);
end