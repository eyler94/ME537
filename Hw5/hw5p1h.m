%hw5p1h
%Use animate to compare rotational interpolation using quaternions, Euler angles
%and roll-pitch-yaw angles. Hint: use the quaternion interp method and mtraj.

clear
close all
clc

R = rotx(0)*roty(0)*rotz(0);
Q = UnitQuaternion(R);
T = r2t(R);
eul = tr2eul(T);
rpy = tr2rpy(T);

R1 = rotx(pi/4)*roty(pi/2)*rotz(pi/3);
Q1 = UnitQuaternion(R1);
T1 = r2t(R1);
eul1 = tr2eul(T1);
rpy1 = tr2rpy(T1);

figure(1)
q = interp(Q,Q1,50);
q.animate('retain','rgb')

figure(2)
[Q] = mtraj(@lspb,eul,eul1,50);
tranimate(eul2r(Q),'retain','rgb')

figure(3)
[Q] = mtraj(@lspb,rpy,rpy1,50);
tranimate(rpy2r(Q),'retain','rgb')


% tranimate(Q)
