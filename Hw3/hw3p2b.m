%hw3p2b
clear
close all
clc

%th d a al
%q1 0 a1 0
%q2 0 ac 0

syms q1 q2 a1 ac

A1 = trotz(q1)*transl([a1,0,0]);
  
A2 = trotz(q2)*transl([ac,0,0]);
  
FK = A1*A2

T1 = A1;
T2 = A1*A2;

Z00 = [0;0;1];
Z01 = T1(1:3,3);

O00 = [0;0;0];
O01 = T1(1:3,4);
O02 = T2(1:3,4);

J = [cross(Z00,(O02-O00))   cross(Z01,(O02-O01)); 
     Z00                    Z01                 ]

