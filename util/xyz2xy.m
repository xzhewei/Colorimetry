function [x,y] = xyz2xy(X,Y,Z)
% ���̼�ֵX,Y,Zת��ΪɫƷ����x,y
t = X+Y+Z;
x = X./t;
y = Y./t;
end