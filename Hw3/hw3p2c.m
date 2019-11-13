%hw3p2c
clear
close all
clc

% part i
%th d a al
%q1 0 a1 pi/2
%q2 0 ac 0

% syms q1 q2 a1 a2
q1 = 0;
q2 = 0;
a1 = 1;
a2 = 1;

A12 = trotz(q2)*transl([a2,0,0]);
  
A01 = trotz(q1)*transl([a1,0,0])*trotx(-sym(pi)/2);

T21 = inv(A12);
T20 = inv(A01*A12);

% Z00 = [0;0;1];
% Z01 = [0;-1;0];
Z21 = T21(1:3,3);
Z20 = T20(1:3,3);

% O00 = [0;0;0];
% O01 = T1(1:3,4);
% O02 = T2(1:3,4);
O22 = [0;0;0];
O21 = T21(1:3,4);
O20 = T20(1:3,4);

J_direct = [cross(Z20,(O22-O20))   cross(Z21,(O22-O21)); 
            Z20                    Z21                 ]

% part ii

J_class = [-a2*sin(q1)*cos(q2)-a1*sin(q1)   -a2*sin(q2)*cos(q1);
            a2*cos(q1)*cos(q2)+a1*cos(q1)   -a2*sin(q2)*sin(q1);
            0                               -a2*sin(q1)*sin(q1)*cos(q2)-a2*cos(q1)*cos(q1)*cos(q2);
            0                               -sin(q1);
            0                               cos(q1);
            1                               0];
        
Rn0 = rotz(q1)*rotx(sym(pi)/2)*rotz(q2);

R = [Rn0 zeros(3);
     zeros(3) Rn0];
 
J_trans = R*J_class


 
 