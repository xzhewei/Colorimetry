function writeConeResp(stdObs)
    % stdObs 是个struct
    %   Name 锥响应曲线的名称
    %   Wavelength 波长
    %   X X响应曲线
    %   Y Y响应曲线
    %   Z Z响应曲线
    toTxt(stdObs);
end
function toTxt(stdObs)
    filename = stdObs.Name;
    filename = [filename '.txt'];
    fid = fopen(filename,'w');
    fprintf(fid,['#' stdObs.Name '\n']);
    data = [stdObs.Wavelength,stdObs.X,stdObs.Y,stdObs.Z];
    fprintf(fid,'%.1f %.12f %.12f %.12f\n',data');
    fclose(fid);
end