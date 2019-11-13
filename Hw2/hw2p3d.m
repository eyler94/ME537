clear
clc
close all

syms q1 q2 q3 d1 a2 a3

A1 = DH_mat(q1, d1, 0, sym(pi)/2)

A2 = DH_mat(q2, 0, a2, 0)

A3 = DH_mat(q3, 0, a3, 0)

A = A1*A2*A3
