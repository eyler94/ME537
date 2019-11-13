clear
clc
close all

T01 = [zeros([3,3]) [0;1;1];
       0 0 0 1]
   
T02 = [zeros([3,3]) [0.5;1.5;1.1];
       0 0 0 1]

R03a = rotz(pi/2);

R03b = rotx(pi);

R03 = R03a*R03b
   
T03 = [R03 [0.5;1.5;3];
       0 0 0 1]

T23 = [R03 [0; 0; 1.9]
       0 0 0 1]

