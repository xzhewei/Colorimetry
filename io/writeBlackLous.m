function writeBlackLous(lous)
    % lous �Ǹ�struct
    %   Space ����켣���ڵ�ɫ�ռ�
    %   Coord ����켣
    %   CCT   ����켣��Ӧ��ɫ��
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