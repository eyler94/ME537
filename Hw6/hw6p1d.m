%hw6p1d

clear
close all
clc

syms m1 m2 m3 Ixx Iyy Izz q1 q2 q3 q1_d q2_d q3_d g real

a = 0.2;
l = 0.4;

I = [Ixx 0 0;
     0 Iyy 0;
     0 0 Izz];
 
zvec = [0 0 1]';
o01com = [a*cos(q1) a*sin(q1) 0]';
o00 = [0 0 0]';
Jcom_1 = [cross(zvec,o01com-o00) zeros([3 2]); 
          zvec zeros([3 2])];
Jv1 = Jcom_1(1:3,1:3);
Jw1 = Jcom_1(4:6,1:3);

o02com = [l*cos(q1)+a*cos(q1+q2) l*sin(q1)+a*sin(q1+q2) 0]';
o01 = [a*cos(q1+q2) a*sin(q1+q2) 0]';
Jcom_2 = [cross(zvec,o02com-o00) cross(zvec,o02com-o01) zeros([3 1]);
          zvec zvec zeros([3 1])]
Jv2 = Jcom_2(1:3,1:3);
Jw2 = Jcom_2(4:6,1:3);

% o03com = [l*cos(q1)+a*cos(q2) l*sin(q1)+a*sin(q2) 0]';
% o12 = [a*cos(q1+q2) a*sin(q1+q2) 0]';
% Jcom_2 = [cross(zvec,o02com-o00) cross(zvec,o02com-o01) zeros([3 1]);
%           zvec zvec zeros([3 1])];
% Jv2 = Jcom_2(1:3,1:3);
% Jw2 = Jcom_2(4:6,1:3);


% 
% M = m1*Jv1'*Jv1 + m2*Jv2'*Jv2 + m3*Jv3'*Jv3
%       
% % part iii
% % Because all of the Christoffel symbols are derivatives of the inertia
% % matrix components with respect to a given q, and none of the inertia
% % matrix entries are functions of q, all of the Christoffel symbols are
% % equal to 0. This means that the velocity at which the joints move won't
% % have an impact on the non-conservative forces or torques.
% C = zeros(3,3);
% 
% % part iv
% syms qddot [3 1] real
% syms qdot [3 1] real
% syms q [3 1] real
% syms tau [3 1] real
% 
% g = [0 0 9.81]';
% 
% G = m1*g'*[0 0 q1]' + m2*g'*[0 q2 q1]' + m3*g'*[q3 q2 q1]' 
% 
% M*qddot + C*qdot + [G 0 0]' == tau


