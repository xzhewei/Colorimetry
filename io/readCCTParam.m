function cctParam = readCCTParam()
    cctParam = fromTxt();
end

function cctParam = fromTxt()
    filename = 'CCT_Param.txt';
    fid = fopen(filename,'r');
    fscanf(fid,'%s#');
    mrd = fscanf(fid,'%f',[1,inf]);
    fscanf(fid,'#END%s#');
    cct = fscanf(fid,'%f',[1,inf]);
    fscanf(fid,'#END%s#');
    xy = fscanf(fid,'%f',[4,inf]);
    fscanf(fid,'#END%s#');
    uv = fscanf(fid,'%f',[4,inf]);
    cctParam.MRD = mrd';
    cctParam.CCT = cct';
    cctParam.OnXY = xy([1,2],:)';
    cctParam.ExXY = xy([3,4],:)';
    cctParam.OnUV = uv([1,2],:)';
    cctParam.ExUV = uv([3,4],:)';
    cctParam.KXY = ((xy(4,:) -  xy(2,:))./(xy(3,:) -  xy(1,:)))';
    cctParam.KUV = ((uv(4,:) -  uv(2,:))./(uv(3,:) -  uv(1,:)))';
    fclose(fid);
end