function writeConeResp(stdObs)
    % stdObs �Ǹ�struct
    %   Name ׶��Ӧ���ߵ�����
    %   Wavelength ����
    %   X X��Ӧ����
    %   Y Y��Ӧ����
    %   Z Z��Ӧ����
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