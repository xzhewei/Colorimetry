function cct = spd2cct(SPD)
    [X,Y,Z] = spd2xyz(SPD);
    [x,y] = xyz2xy(X,Y,Z);
    cct = xy2cct(x,y);
end