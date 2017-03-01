function cqsTCS = readCQSTCS(varargin)
    switch(nargin)
        case 0
            cqsTCS = fromTxt(15);
        case 1
            range = varargin{1};
            cqsTCS = fromTxt(range);
        otherwise
            error('Invalid argument.');
    end
end

function cqsTCS = fromTxt(range)
    filename = 'CQS_TCS_15.txt';
    fid = fopen(filename,'r');
    fscanf(fid,'%s#');
    wave = fscanf(fid,'%d',[1,inf]);
    fscanf(fid,'#END%s#');
    
    name = cell(1,range);
    munsell = cell(1,range);
    tcsr = zeros(range,size(wave,2));
    for i = 1:range
        fscanf(fid,'%s#');
        fscanf(fid,'%s#');
        name{i} = fscanf(fid,'%s#');
        name{i} = strrep(name{i},'_',' ');
        fscanf(fid,'%s#');
        munsell{i} = fscanf(fid,'%s#');
        munsell{i} = strrep(munsell{i},'_',' ');
        fscanf(fid,'%s#');
        tcsr(i,:) = fscanf(fid,'%f',[1,inf]);
        fscanf(fid,'#END%s#');
    end
    cqsTCS.Wavelength = wave';
    cqsTCS.Name = name';
    cqsTCS.Munsell = munsell';
    cqsTCS.TCSR = tcsr';
end