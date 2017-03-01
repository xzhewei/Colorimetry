function [x,y] = xyz2xy(X,Y,Z)
% 三刺激值X,Y,Z转换为色品坐标x,y
t = X+Y+Z;
x = X./t;
y = Y./t;
end