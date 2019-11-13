clear 
close all
clc

%MDL_HW_2

%%%%%%%%%%%%% theta, d, a, alpha, revolute or prismatic, offset
L(1) = Link([ 0     0.2     0          -pi/2    0        0], 'standard');
L(2) = Link([ 0 	0.      0.2        0        0        0], 'standard');
L(3) = Link([ 0     0.      0         pi/2    0         pi/2], 'standard');
L(4) = Link([ 0     0.4     0        -pi/2    0         pi/2], 'standard');
L(5) = Link([ 0     0.0     0         pi/2    0         0   ], 'standard');
L(6) = Link([ 0     0.4     0          0      0         0], 'standard');


%%defining the robot now
robot = SerialLink(L, 'name', 'HW 2', ...
    'manufacturer', 'Killpack Inc.');

% some useful poses
q1 = [0 0 0 0 0 0]';
q2 = [pi/2 pi/2 pi/2 pi/2 pi/2 pi/2]';

p1 = robot.fkine([0 0 0 0 0 0]*pi/2).t;
p2 = robot.fkine([0 0 0 0 0 1]*pi/2).t;
p3 = robot.fkine([0 0 0 0 1 0]*pi/2).t;
p4 = robot.fkine([0 0 0 0 1 1]*pi/2).t;
p5 = robot.fkine([0 0 0 1 0 0]*pi/2).t;
p6 = robot.fkine([0 0 0 1 0 1]*pi/2).t;
p7 = robot.fkine([0 0 0 1 1 0]*pi/2).t;
p8 = robot.fkine([0 0 0 1 1 1]*pi/2).t;
p9 = robot.fkine([0 0 1 0 0 0]*pi/2).t;
p10 = robot.fkine([0 0 1 0 0 1]*pi/2).t;

q1_1_1 = IK_JacobianTranspose(robot,q1,p1)
q2_1_1 = IK_JacobianTranspose(robot,q1,p2)
q3_1_1 = IK_JacobianTranspose(robot,q1,p3)
q4_1_1 = IK_JacobianTranspose(robot,q1,p4)
q5_1_1 = IK_JacobianTranspose(robot,q1,p5)
q6_1_1 = IK_JacobianTranspose(robot,q1,p6)
q7_1_1 = IK_JacobianTranspose(robot,q1,p7)
q8_1_1 = IK_JacobianTranspose(robot,q1,p8)
q9_1_1 = IK_JacobianTranspose(robot,q1,p9)
q10_1_1 = IK_JacobianTranspose(robot,q1,p10)

q1_2_1 = IK_JacobianTranspose(robot,q2,p1)
q2_2_1 = IK_JacobianTranspose(robot,q2,p2)
q3_2_1 = IK_JacobianTranspose(robot,q2,p3)
q4_2_1 = IK_JacobianTranspose(robot,q2,p4)
q5_2_1 = IK_JacobianTranspose(robot,q2,p5)
q6_2_1 = IK_JacobianTranspose(robot,q2,p6)
q7_2_1 = IK_JacobianTranspose(robot,q2,p7)
q8_2_1 = IK_JacobianTranspose(robot,q2,p8)
q9_2_1 = IK_JacobianTranspose(robot,q2,p9)
q10_2_1 = IK_JacobianTranspose(robot,q2,p10)

%% part 2
clc
q1_1_2 = IK_Damped_PseudoInverse(robot,q1,p1)
q2_1_2 = IK_Damped_PseudoInverse(robot,q1,p2)
q3_1_2 = IK_Damped_PseudoInverse(robot,q1,p3)
q4_1_2 = IK_Damped_PseudoInverse(robot,q1,p4)
q5_1_2 = IK_Damped_PseudoInverse(robot,q1,p5)
q6_1_2 = IK_Damped_PseudoInverse(robot,q1,p6)
q7_1_2 = IK_Damped_PseudoInverse(robot,q1,p7)
q8_1_2 = IK_Damped_PseudoInverse(robot,q1,p8)
q9_1_2 = IK_Damped_PseudoInverse(robot,q1,p9)
q10_1_2 = IK_Damped_PseudoInverse(robot,q1,p10)

q1_2_2 = IK_Damped_PseudoInverse(robot,q2,p1)
q2_2_2 = IK_Damped_PseudoInverse(robot,q2,p2)
q3_2_2 = IK_Damped_PseudoInverse(robot,q2,p3)
q4_2_2 = IK_Damped_PseudoInverse(robot,q2,p4)
q5_2_2 = IK_Damped_PseudoInverse(robot,q2,p5)
q6_2_2 = IK_Damped_PseudoInverse(robot,q2,p6)
q7_2_2 = IK_Damped_PseudoInverse(robot,q2,p7)
q8_2_2 = IK_Damped_PseudoInverse(robot,q2,p8)
q9_2_2 = IK_Damped_PseudoInverse(robot,q2,p9)
q10_2_2 = IK_Damped_PseudoInverse(robot,q2,p10)

%% part 3
clc
close all
plot3(p4(1),p4(2),p4(3),'x')
hold on 
robot.plot(q4_1_1')
pause
robot.plot(q4_2_1')
pause
robot.plot(q4_1_2')
pause
robot.plot(q4_2_2')


