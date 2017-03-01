function writeCRITCS(criTCS)
    % criTCS �Ǹ�struct
    %   Name        15x1 cell ÿ��ɫ������������
    %   Munsell     15x1 cell ÿ��ɫ�������������
    %   Wavelength  ÿ�����׷����ʶ�Ӧ�Ĳ���
    %   TCSR        15��ɫ���Ĺ��׷����ʰ�������
    toTxt(criTCS);
end
function toTxt(criTCS)
    filename = 'CRI_TCS_15.txt';
    fid = fopen(filename,'w');
    fprintf(fid,'#Wavelength\n');
    fprintf(fid,'%d\n',criTCS.Wavelength');
    fprintf(fid,'#END\n');
    fprintf(fid,'#TCS\n');
    for i = 1:15;
        fprintf(fid,['#TCS' num2str(i) '\n']);
        fprintf(fid,'#Name %s\n',strrep(criTCS.Name{i},' ','_'));
        fprintf(fid,'#Munsell %s\n',strrep(criTCS.Munsell{i},' ','_'));
        fprintf(fid,'#TCSR\n');
        fprintf(fid,'%.6f\n',criTCS.TCSR(:,i)');
        fprintf(fid,'#END\n');
        fprintf(fid,'#END\n');
    end
    fprintf(fid,'#END\n');
    fclose(fid);
end