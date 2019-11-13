%hw5p1g

clear
close all
clc

figure(1)
lspb(0,1,41,0.025)
[ls,lsd,lsdd] = lspb(0,1,41,0.025);
max(lsd)
figure(2)
tpoly(0,1,76,0,0)
[s,sd,sdd] = tpoly(0,1,76,0,0);
max(sd)

% Number of times steps required are: 41, 76

