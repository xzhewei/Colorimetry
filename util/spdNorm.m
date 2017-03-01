function nspd = spdNorm(spd)
    [m,n] = size(spd);
    if m == 2
        nspd = spd';
    elseif n == 2
        nspd = spd;
    else
        error(['Spectrum mat must be 2 x N or N x 2.',m,n]);
    end
end