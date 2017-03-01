function writeCQSTCS(cqsTCS)
    % cqsTCS 是个struct
    %   Name        15x1 cell 每个色样的文字描述
    %   Munsell     15x1 cell 每个色样的孟塞尔标号
    %   Wavelength  每个光谱反射率对应的波长
    %   TCSR        15个色样的光谱反射率按列排列
    toTxt(cqsTCS);
end

function toTxt(cqsTCS)
    filename = 'CQS_TCS_15.txt';
    fid = fopen(filename,'w');
    fprintf(fid,'#Wavelength\n');
    fprintf(fid,'%d\n',cqsTCS.Wavelength');
    fprintf(fid,'#END\n');
    fprintf(fid,'#TCS\n');
    for i = 1:15;
        fprintf(fid,['#TCS' num2str(i) '\n']);
        fprintf(fid,'#Name %s\n',strrep(cqsTCS.Munsell{i},' ','_'));
        fprintf(fid,'#Munsell %s\n',strrep(cqsTCS.Munsell{i},' ','_'));
        fprintf(fid,'#TCSR\n');
        fprintf(fid,'%.6f\n',cqsTCS.TCSR(:,i)');
        fprintf(fid,'#END\n');
        fprintf(fid,'#END\n');
    end
    fprintf(fid,'#END\n');
    fclose(fid);
end