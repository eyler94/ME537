%hw5p1e

clear
close all
clc

figure(1)
tpoly(0,1,50,0,0)
pause
figure(2)
tpoly(0,1,50,0,1)
pause
figure(3)
tpoly(0,1,50,0,0.1)
pause
figure(4)
tpoly(0,1,50,0,0.5)
pause
figure(5)
tpoly(0,1,50,1,0)
pause
figure(6)
tpoly(0,1,50,-10,0)
pause
figure(7)
tpoly(0,1,50,-1,0)
pause
figure(8)
tpoly(0,1,50,0,-1)
pause
figure(9)
tpoly(0,1,50,0,1)
pause
figure(10)
tpoly(0,1,50,0,10)

%Final velocity constraints forces an overshoot in the opposite direction.
%While initial velocity constraints force it to overshoot in the same 
%direction.

