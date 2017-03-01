function [X,Y,Z] = rgb2xyz(R,G,B)
    result = [2.7689,1.7517,1.1302;
           1.0000,4.5907,0.0601;
           0.0000,0.0565,5.5943]*[R;G;B];
       X = result(1,:);
       Y = result(2,:);
       Z = result(3,:);
end