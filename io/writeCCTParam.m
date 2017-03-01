function writeCCTParam(cctParam)
    % cctParam 是个struct
    %   MRD   麦尔德
    %   CCT   相关色温
    %   OnXY  黑体轨迹上的XY坐标
    %   OnUV  黑体轨迹上的UV坐标
    %   ExXY  黑体轨迹外的XY坐标
    %   ExUV  黑体轨迹外的UV坐标
    toTxt(cctParam);
end
function toTxt(cctParam)
    filename = 'CCT_Param.txt';
    fid = fopen(filename,'w');
    fprintf(fid,'#MRD\n');
    fprintf(fid,'%.f\n',cctParam.MRD);
    fprintf(fid,'#END\n');
    fprintf(fid,'#CCT\n');
    fprintf(fid,'%.f\n',cctParam.CCT);
    fprintf(fid,'#END\n');
    fprintf(fid,'#OnX_OnY_ExX_ExY\n');
    fprintf(fid,'%.4f %.4f %.4f %.4f\n',[cctParam.OnXY,cctParam.ExXY]');
    fprintf(fid,'#END\n');
    fprintf(fid,'#OnU_OnV_ExU_ExV\n');
    fprintf(fid,'%.4f %.4f %.4f %.4f\n',[cctParam.OnUV,cctParam.ExUV]');
    fprintf(fid,'#END\n');
    fclose(fid);
end