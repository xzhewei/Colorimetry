function stdObs = readConeResp(type)
    %% type
    %   cie_std2
    %   cie_std10 
    stdObs = fromTxt(type);
end

function stdObs = fromTxt(type)
    switch(type)
        case 'cie_std2'
            filename = 'CIE_StdObserver_2.txt';
        case 'cie_std10'
            filename = 'CIE_StdObserver_10.txt';
    end
    fid = fopen(filename,'r');
    name = fscanf(fid,'#%s#');
    data = fscanf(fid,'%f',[4,inf]);
    data = data';
    stdObs.Name = name;
    stdObs.Wavelength = data(:,1);
    stdObs.X = data(:,2);
    stdObs.Y = data(:,3);
    stdObs.Z = data(:,4);
    fclose(fid);
end