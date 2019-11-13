%hw5p1d

clear
close all
clc

x = sym('x',[3,3],'real');
y = sym('y',[3,3],'real');

for k=0:1
    e_x = mat_e(x,k)
    e_y = mat_e(y,k)
    e_xty = mat_e(x,k)*mat_e(y,k)
    e_xpy = mat_e(x+y,k)
end

% It's definitely not, as it misses out on several middle terms. Similarly
% to x^2+y^2!=(x+y)^2
