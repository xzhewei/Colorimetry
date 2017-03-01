function [u,v] = xy2uv(x,y)
    if isvector(x) && isvector(y)
        base = -2.*x +12.*y + 3;
        u = 4.*x./base;
        v = 6.*y./base;
    else
        error('Input must all vector.');
    end
end