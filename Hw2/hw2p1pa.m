clc
clear
close all

syms r p y

R = simplify(rpy2r(r,p,y))

syms r3_1 r3_2 r2_1

p = -asin(r3_1)

r3_2 = cos(p)*sin(r);
sin(r) = r3_2/cos(p);
r = asin(r3_2/cos(-asin(r3_1)))

r2_1 = cos(p)*sin(y);
sin(y) = r2_1/cos(p);
y = asin(r2_1/cos(-asin(r3_1)))


