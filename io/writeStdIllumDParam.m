function writeStdIllumDParam(stdDParam)
    % stdDParam   是个struct
    %   Wavelength  代表波长
    %   S0          第一个特征向量
    %   S1          第二个特征向量
    %   S2          第三个特征向量
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