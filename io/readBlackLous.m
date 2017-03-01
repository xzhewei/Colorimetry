function lous = readBlackLous()
    lous = fromTxt();
end

function lous = fromTxt()
    filename = 'CIE_1931_XYZ_BlackLous.txt';
    fid = fopen(filename,'r');
    fscanf(fid,'%s#');
    space = fscanf(fid,'%s#');
    fscanf(fid,'%s#');
    data = fscanf(fid,'%f',[3,inf]);
    data = data';
    lous.Space = space;
    lous.Coord = data(:,[1,2]);
    lous.CCT = data(:,3);
    fclose(fid);
end