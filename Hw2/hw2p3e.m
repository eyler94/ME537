clear
clc
close all

syms q1 q2 q3

d1 = 1
a2 = 1
a3 = 1

% syms q1 d1 q2 a2 q3 a3

T1 = [rotz(q1) [0; 0; d1];
      0 0 0 1];
 
T2 = [roty(-q2)*rotx(pi/2) [a2; 0; 0];
      0 0 0 1];
 
T3 = [rotz(q3) [a3; 0; 0];
      0 0 0 1];

T = T1*T2*T3

% syms q1 q2 q3 d1 a2 a3

A1 = DH_mat(q1, d1, 0, sym(pi)/2);

A2 = DH_mat(q2, 0, a2, 0);

A3 = DH_mat(q3, 0, a3, 0);

A = A1*A2*A3

% They are very close to the same. I suspect they would be if I used the
% same variables and general directions of rotation. They differ most in
% translation.


    
