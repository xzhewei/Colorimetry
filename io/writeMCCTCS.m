function writeMCCTCS(mccTCS)
    % mccTCS �Ǹ�struct
    %   Name        15x1 cell ÿ��ɫ������������
    %   Munsell     15x1 cell ÿ��ɫ�������������
    %   Wavelength  ÿ�����׷����ʶ�Ӧ�Ĳ���
    %   TCSR        15��ɫ���Ĺ��׷����ʰ�������
    toTxt(mccTCS);
end

function toTxt(mccTCS)
    filename = 'MacBethColorChecker.txt';
    fid = fopen(filename,'w');
    fprintf(fid,'#Wavelength\n');
    fprintf(fid,'%d\n',mccTCS.Wavelength);
    fprintf(fid,'#END\n');
    fprintf(fid,'#TCS\n');
    for i = 1:24;
        fprintf(fid,['#TCS' num2str(i) '\n']);
%         fprintf(fid,'#Name %s\n',strrep(cqsTCS.Munsell{i},' ','_'));
%         fprintf(fid,'#Munsell %s\n',strrep(cqsTCS.Munsell{i},' ','_'));
        fprintf(fid,'#Name None\n');
        fprintf(fid,'Munsell None\n');
        fprintf(fid,'#TCSR\n');
        fprintf(fid,'%.6f\n',mccTCS.TCSR(:,i)');
        fprintf(fid,'#END\n');
        fprintf(fid,'#END\n');
    end
    fprintf(fid,'#END\n');
    fclose(fid);
end