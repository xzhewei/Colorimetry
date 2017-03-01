function [X,Y,Z] = xyY2XYZ(x,y,Y)
    XYZ = Y./y;
    X = x.*XYZ;
    Z = XYZ-Y-X;
end