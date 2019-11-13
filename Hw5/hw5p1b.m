%hw5p1b

clear
close all
clc

vec = [2,3,4]';
vec_hat = vec/norm(vec);
theta = 0.5;

R_e = expm(skew(vec_hat)*theta)
R_tr = trexp(vec_hat,theta)
R_Rrf = eye(3)*cos(theta)+vec_hat*vec_hat'*(1-cos(theta))+skew(vec_hat)*sin(theta)
R_htm = angvec2tr(theta,vec_hat);
R_htm = R_htm(1:3,1:3)

q0 = cos(theta/2)
q = vec_hat*sin(theta/2)
% Check for unit
norm([q0 q'])
