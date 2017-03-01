function illum = readStdIllum(name)
    %% name 
    %   CIE_A
    %   CIE_B
    %   CIE_C
    %   CIE_D50
    %   CIE_D55
    %   CIE_D65
    %   CIE_D75
    illum = fromTxt(name);
end

function illum = fromTxt(name)
    filename = [name '.txt'];
    fid = fopen(filename,'r');
    name = fscanf(fid,'#Name %s#');
    fscanf(fid,'%s#');
    cct = fscanf(fid,'%f');
    fscanf(fid,'%s#');
    cri = fscanf(fid,'%f');
    fscanf(fid,'%s#');
    spd = fscanf(fid,'%f',[2,inf]);
    spd = spd';
    illum.Name = name;
    illum.CCT = cct;
    illum.Ra = cri;
    illum.SPD = spd;
    fclose(fid);
end