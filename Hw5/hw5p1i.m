%hw5p1i
%For the mstraj example (page 75)
%   a) Repeat with different initial and final velocity.
%   b) Investigate the effect of increasing the acceleration time. Plot total time as a function of acceleration time.

clear
close all
clc

via = SO2(30, 'deg') * [-1 1; 1 1; 1 -1; -1 -1]';
q0 = mstraj(via(:,[2 3 4 1])', [2,1], [], via(:,1)', 0.2, 0);
plot(q0(:,1), q0(:,2))
hold on
q2 = mstraj(via(:,[2 3 4 1])', [2,1], [], via(:,1)', 0.2, 2);
plot(q2(:,1), q2(:,2))
q3 = mstraj(via(:,[2 3 4 1])', [0.1,0.5], [], via(:,1)', 0.2, 2);
plot(q3(:,1), q3(:,2))
q4 = mstraj(via(:,[2 3 4 1])', [2,1], [], via(:,1)', 0.2, 500);
plot(q4(:,1), q4(:,2))
% [numrows(q0) numrows(q2)]

