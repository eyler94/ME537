clear
clc
close all

R = [cos(pi/4) -sin(pi/4) 0 1;
     sin(pi/4) cos(pi/4) 0 1;
     0 0 1 1;
     0 0 0 1];

tranimate(R)
 
Vec = [1; 3; 2; 1];

Vec_new = R*Vec

R*pinv(R)

% The result is the identity!

pinv(R)*R

%The result is still the identity!
