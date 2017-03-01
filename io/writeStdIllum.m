function writeStdIllum(illum)
    toTxt(illum);
end

function toTxt(illum)
    filename = [illum.Name '.txt'];
    fid = fopen(filename,'w');
    fprintf(fid,['#Name ' illum.Name '\n']);
    fprintf(fid,['#CCT ' num2str(illum.CCT) '\n']);
    fprintf(fid,['#CRI ' num2str(illum.Ra) '\n']);
    fprintf(fid,'#Spectrum_Power_Distribution\n');
    fprintf(fid,'%.1f    %f\n',illum.SPD');
    fclose(fid);
end