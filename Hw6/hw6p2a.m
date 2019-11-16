%hw6p2a

clear
close all
clc

% Load robot model and desired position vector
load('desired_accel.mat');
[left, right] = mdl_baxter('sim');

q_d = [diff(q); zeros(1,7)];
q_dd = [diff(q_d); zeros(1,7)];

tau = left.rne(q,q_d,q_dd);

figure(1)
subplot(2,2,1)
plot(t,tau(:,1),t,tau(:,2),t,tau(:,3),t,tau(:,4),t,tau(:,5),t,tau(:,6),t,tau(:,7))
title('Required Torques for given position and time requirements.')
legend('tau1','tau2','tau3','tau4','tau5','tau6','tau7')

subplot(2,2,2)
plot(t,q(:,1),t,q(:,2),t,q(:,3),t,q(:,4),t,q(:,5),t,q(:,6),t,q(:,7))
title('Required joint positions relative to time.')
legend('q1','q2','q3','q4','q5','q6','q7')

subplot(2,2,3)
plot(t,q_d(:,1),t,q_d(:,2),t,q_d(:,3),t,q_d(:,4),t,q_d(:,5),t,q_d(:,6),t,q_d(:,7))
title('Required joint velocities relative to time.')
legend('q_d1','q_d2','q_d3','q_d4','q_d5','q_d6','q_d7')

subplot(2,2,4)
plot(t,q_dd(:,1),t,q_dd(:,2),t,q_dd(:,3),t,q_dd(:,4),t,q_dd(:,5),t,q_dd(:,6),t,q_dd(:,7))
title('Required joint accelerations relative to time.')
legend('q_dd1','q_dd2','q_dd3','q_dd4','q_dd5','q_dd6','q_dd7')

