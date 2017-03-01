function [R,G,B] = xyz2rgb(X,Y,Z)
    XYZ = [X;Y;Z];
    result = [0.4185,-0.1587,-0.0828;
              -0.0912,0.2524,0.0157;
              0.0009,0.0025,0.1786]*XYZ;
    R = result(1,:);
    G = result(2,:);
    B = result(3,:);
end