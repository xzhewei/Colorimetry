function writeStdIllumDParam(stdDParam)
    % stdDParam   �Ǹ�struct
    %   Wavelength  ������
    %   S0          ��һ����������
    %   S1          �ڶ�����������
    %   S2          ��������������
    toTxt(stdDParam);
end
function toTxt(stdDParam)
    filename = 'CIE_Standard_Illuminant_D.txt';
    fid = fopen(filename,'w');
    fprintf(fid,'#Wavelength_S0_S1_S2\n');
    data = [stdDParam.Wavelength,stdDParam.S0,stdDParam.S1,stdDParam.S2];
    fprintf(fid,'%d %f %f %f\n',data');
    fclose(fid);
end