function lamp = readSPR3000(filename)
    lamp = initStruct();
    fid = fopen(filename,'r');
    while feof(fid) == 0
        tline = fgetl(fid);
        s = regexp(tline,',','split');
        field = regexprep(s{1},'\W+','');
        if isempty(field)
           continue; 
        end
        value = s{2};
        numf = str2double(field);
        numv = str2double(value);
        if isnan(numf)
            if isnan(numv)
                lamp = setfield(lamp,field,value);
            else
                lamp = setfield(lamp,field,numv);
            end   
        else
            spd = fscanf(fid,'%f,%f',[2,inf]);
            lamp.SPD = [numf,numv;spd'];
        end
    end
    fclose(fid);
end

function st = initStruct()
    st = struct('SerialNO',[],...
                'Product',[],...
                'Manufacturer1',[],...
                'Client',[],...
                'Operator',[],...
                'Reviewer',[],...
                'Temperature',[],...
                'Humidity',[],...
                'RefGain',[],...
                'SpeGain',[],...
                'LumEff',[],...
                'StartWL',[],...
                'EndWL',[],...
                'Year',[],...
                'Month',[],...
                'Day',[],...
                'Step',[],...
                'x',[],...
                'y',[],...
                'u',[],...
                'v',[],...
                'CCT',[],...
                'CRI',[],...
                'Discrepancy',[],...
                'SPD',[],...
                'SDCM',[],...
                'RadiantFlux',[],...
                'Voltage',[],...
                'Flux',[],...
                'Current',[],...
                'LampVoltage',[],...
                'Power',[],...
                'PowerFactor',[],...
                'Points',[],...
                'Maximum',[],...
                'Kr',[],...
                'R1',[],...
                'R2',[],...
                'R3',[],...
                'R4',[],...
                'R5',[],...
                'R6',[],...
                'R7',[],...
                'R8',[],...
                'R9',[],...
                'R10',[],...
                'R11',[],...
                'R12',[],...
                'R13',[],...
                'R14',[],...
                'R15',[],...
                'DarkVisualFlux',[],...
                'PeakWL',[]);
end