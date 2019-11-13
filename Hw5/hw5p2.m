%hw5p2

clear
close all
clc

omega = sym("w",[1,3],'real')
p = sym("p",[1,3],'real')


lhs = skew(omega)*p'

rhs = cross(omega,p)

isequal(lhs,rhs')

