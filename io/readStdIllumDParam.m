function stdIllumDParam = readStdIllumDParam()
    % stdDParam   是个struct
    %   Wavelength  代表波长
    %   S0          第一个特征向量
    %   S1          第二个特征向量
    %   S2          第三个特征向量
    stdIllumDParam = fromTxt();
end

function stdDParam = fromTxt()
    filename = 'CIE_Standard_Illuminant_D.txt';
    fid = fopen(filename,'r');
    fscanf(fid,'%s#');
    data = fscanf(fid,'%f',[4,inf]);
    data = data';
    stdDParam.Wavelength = data(:,1);
    stdDParam.S0 = data(:,2);
    stdDParam.S1 = data(:,3);
    stdDParam.S2 = data(:,4);
    fclose(fid);
end