clear
close all
clc

%The rotation matrix is as follows.

R = [1 0 0;
    0 cos(-pi/2) -sin(-pi/2);
    0 sin(-pi/2) cos(-pi/2)];

s = 1/2*sqrt(R(1,1) + R(2,2) + R(3,3) + 1)

v1 = 1/2*sign(R(3,2)-R(2,3))*sqrt(R(1,1) - R(2,2) - R(3,3) + 1)
v2 = 1/2*sign(R(1,3)-R(3,1))*sqrt(R(2,2) - R(3,3) - R(1,1) + 1)
v3 = 1/2*sign(R(2,1)-R(1,2))*sqrt(R(3,3) - R(1,1) - R(2,2) + 1)




