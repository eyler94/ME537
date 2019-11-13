clear
close all
clc

% syms a1 a2
a1 = 1;
a2 = 1;
% i
tau = Req_Torq([0,sym(pi)/4],[-1,0,0,0,0,0]')

% ii
tau = Req_Torq([0,sym(pi)/2],[-1,0,0,0,0,0]')

% iii
tau = Req_Torq([sym(pi)/4,sym(pi)/4],[-1,-1,0,0,0,0]')

% iv
tau = Req_Torq([0,0],[0,0,1,0,0,0]')

% v
tau = Req_Torq([0,0],[1,0,0,0,0,0]')


%%% It reverse the direction of the torque.
