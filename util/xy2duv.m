function D = xy2duv(x,y)
    cct = xy2cct(x,y);
    spd = blackSPD(cct);
    [X,Y,Z] = spd2xyz(spd);
    [u,v] = xyz2uv(X,Y,Z);
    [su,sv] = xy2uv(x,y);
    D = sqrt((u-su)^2 + (v-sv)^2);
end