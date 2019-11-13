%hw6p1c

clear
close all
clc

hw6p1a

% part i
I1 = subs(I,[a,b,c,mass],[0.25,0.25,1,1])
I2 = subs(I,[a,b,c,mass],[0.25,1,0.25,1])
I3 = subs(I,[a,b,c,mass],[1,0.25,0.25,1])

% part ii
syms q1 q2 q3 real
z00 = [0 0 1]';
% o01com = [0 0 0.5]';
% o00 = [0 0 0]';
Jcom_1 = [z00 zeros([3 2]); % cross(z00,o01com-o00)
          zeros([3 3])];
Jv1 = Jcom_1(1:3,1:3);
z01 = [0 1 0]';
Jcom_2 = [z00 z01 zeros([3 1]); % cross(z00,o01com-o00)
          zeros([3 3])];
Jv2 = Jcom_2(1:3,1:3);
z02 = [1 0 0]';
Jcom_3 = [z00 z01 z02; % cross(z00,o01com-o00)
          zeros([3 3])];
Jv3 = Jcom_3(1:3,1:3);

m1 = 1;
m2 = 1;
m3 = 1;

M = m1*Jv1'*Jv1 + m2*Jv2'*Jv2 + m3*Jv3'*Jv3
      
% part iii
% Because all of the Christoffel symbols are derivatives of the inertia
% matrix components with respect to a given q, and none of the inertia
% matrix entries are functions of q, all of the Christoffel symbols are
% equal to 0. This means that the velocity at which the joints move won't
% have an impact on the non-conservative forces or torques.
C = zeros(3,3);

% part iv
syms qddot [3 1] real
syms qdot [3 1] real
syms q [3 1] real
syms tau [3 1] real

g = [0 0 9.81]';

G = m1*g'*[0 0 q1]' + m2*g'*[0 q2 q1]' + m3*g'*[q3 q2 q1]' 

M*qddot + C*qdot + [G 0 0]' == tau


