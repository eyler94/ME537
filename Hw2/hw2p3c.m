clear
clc
close all

syms q1 q2 d2 a1

A1 = DH_mat(q1+pi/2, 0, a1, sym(pi)/2)

A2 = DH_mat(0, d2+q2, 0, 0)

A = A1*A2
