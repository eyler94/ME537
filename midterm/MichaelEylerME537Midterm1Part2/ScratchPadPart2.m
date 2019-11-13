%% Part 2.m
% T = SE3(goal)
% q_fin = willpack.ikine(T,'mask',[1 1 1 0 0 0])
% willpack.plot(q_fin)


% 
% figure(1)
% willpack.plot(q_init)
% hold on
% plot3(goal(1),goal(2),goal(3),'*','LineWidth',5)  
% [x,y,z] = sphere;
% surf(x*obst_radius+obst_location(1),y*obst_radius+obst_location(2),z*obst_radius+obst_location(3))
% 
% xi_good = [-obst_location(1); -obst_location(2); 8-obst_location(3)];
% 
% pause
% xi_orig = willpack.fkine(q_init).t;
% Tx = SE3([xi_good(1),xi_orig(2),xi_orig(3)]);
% q_fin = willpack.ikine(Tx,'mask',[1 1 1 0 0 0]);
% willpack.plot(q_fin)
% 
% pause
% Ty = SE3([xi_good(1),xi_good(2),xi_orig(3)])
% q_fin = willpack.ikine(Ty,'mask',[1 1 1 0 0 0])
% willpack.plot(q_fin)
% 
% pause
% Tz = SE3([xi_good(1),xi_good(2),xi_good(3)])
% q_fin = willpack.ikine(Tz,'mask',[1 1 1 0 0 0])
% willpack.plot(q_fin)
% 
% 
% 
% q_fin = IK_Damped_PseudoInverse_test(willpack,q_fin',goal',obst_location,obst_radius)

%% Compute_Robot_Path.m



%     figure(1)
%     robot.plot(q_init)
%     hold on
%     [x,y,z] = sphere;
%     surf(x*obst_radius+obst_location(1),y*obst_radius+obst_location(2),z*obst_radius+obst_location(3))
%     plot3(goal(1),goal(2),goal(3),'*','LineWidth',3)
%     xlabel('x')
%     ylabel('y')
%     zlabel('z')
%         
%     point = goal;
%     

%% Detect_Collision.m

% 
%     %Debugging plotter
%     plot3(arm0_2(1,:),arm0_2(2,:),arm0_2(3,:),'*','LineWidth',10)
%     hold on
%     plot3(arm0_4(1,:),arm0_4(2,:),arm0_4(3,:),'*','LineWidth',10)
%     [x,y,z] = sphere;
%     surf(x*obst_radius+obst_location(1),y*obst_radius+obst_location(2),z*obst_radius+obst_location(3))
%     robot.plot(q_current)

