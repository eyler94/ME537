%hw3p2a

clc
clear
close all

%th d a al
% q1 d1 0 pi/2
% q2 0 a2 0 
% q3 0 a3 0

syms q1 q2 q3 d1 a2 a3
% q1 = pi/2
% q2 = pi/2
% q3 = pi/2
% d1 = 0.3
% a2 = 0.3
% a3 = 0.3

A1 = trotz(q1)*transl([0 0 d1])*trotx(pi/2);
  
A2 = trotz(q2)*transl([a2 0 0]);

A3 = trotz(q3)*transl([a3,0,0]);
  
T1 = A1;
T2 = A1*A2;
T3 = A1*A2*A3;

Z00 = [0;0;1];
Z01 = T1(1:3,3);
Z02 = T2(1:3,3);

O00 = [0;0;0];
O01 = T1(1:3,4);
O02 = T2(1:3,4);
O03 = T3(1:3,4);

J = [cross(Z00,(O03-O00))   cross(Z01,(O03-O01))    cross(Z02,(O03-O02));
     Z00                    Z01                     Z02];

% J = subs(J,[d1, a2, a3],[0.3, 0.3, 0.3]);

JHandMade = @(Q1,Q2,Q3) subs(J,[d1, a2, a3, q1, q2, q3],[0.3, 0.3, 0.3, Q1, Q2, Q3]);

% th, d, a, al
L(1) = Link([q1 0.3 0 pi/2 0 0], 'standard');
L(2) = Link([q2 0 0.3 0 0 0], 'standard');
L(3) = Link([q3 0 0.3 0 0 0], 'standard');

bot = SerialLink(L,'name','Hw 3 p 2a');

J = JHandMade(0,0,0)
tlbx = jacob0(bot,[0,0,0])
J = JHandMade(pi/2,pi/2,pi/2)
tlbx = jacob0(bot,[pi/2,pi/2,pi/2])

%The difference between the columns reflects the motion available directly
%at that moment. For example, a change in q2 or q3 at first can only affect
%z, but at the second orientation, a change in q2 can affect y directly.

    
