clear
clc
close all

syms q1 q2 q3 q4 q5 q6 d1 d4 d6 a2

A1 = DH_mat(q1, d1, 0, sym(pi)/2)

A2 = DH_mat(q2, 0, a2, 0)

A3 = DH_mat(q3+sym(pi)/2, 0, 0, sym(pi)/2)

A4 = DH_mat(q4+sym(pi)/2, d4, 0, sym(pi)/2)

A5 = DH_mat(q5, 0, 0, -sym(pi)/2)

A6 = DH_mat(q6, d6, 0, 0)

