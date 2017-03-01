function writeCCTParam(cctParam)
    % cctParam �Ǹ�struct
    %   MRD   �����
    %   CCT   ���ɫ��
    %   OnXY  ����켣�ϵ�XY����
    %   OnUV  ����켣�ϵ�UV����
    %   ExXY  ����켣���XY����
    %   ExUV  ����켣���UV����
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