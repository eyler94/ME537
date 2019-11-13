clear
clc
close all

R = [cos(pi/4) -sin(pi/4);
     sin(pi/4) cos(pi/4)];

trplot2(R)
 
Vec = [1; 3];

Vec_new = R*Vec

R*pinv(R)

%The result is the identity!

pinv(R)*R

%The result is still the identity!

det(R)

det(pinv(R))
 
%They're both one!