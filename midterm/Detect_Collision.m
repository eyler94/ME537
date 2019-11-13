function collision = Detect_Collision(robot, q_current, obst_location, obst_radius)
    %%% Determine if a collision occurs between the robot arm and the
    %%% obstacle by comparing the magnitude of the vectors, between the 
    %%% obst_location and discrete points along the arms, to the
    %%% obst_radius. Returns a collision object containing an occur bool,
    %%% and the collision location.
    %%% And example of the function call with a collision looks like the
    %%% following: collsion = Detect_Collision(willpack, q_init, [0,0,5], 1)
    collision.occur = false;

    % Generate Homogeneous Transformations and Rotations to the vectors that
    %  define each arm.
    T0_1 = trotz(robot.theta(1)+q_current(1))*transl(0,0,robot.d(1))*transl(robot.a(1),0,0)*trotx(robot.alpha(1));
    T1_2 = trotz(robot.theta(2)+q_current(2))*transl(0,0,robot.d(2))*transl(robot.a(2),0,0)*trotx(robot.alpha(2));
    T0_2 = T0_1 * T1_2;
    T2_3 = trotz(robot.theta(3)+q_current(3))*transl(0,0,robot.d(3))*transl(robot.a(3),0,0)*trotx(robot.alpha(3));
    T3_4 = trotz(robot.theta(4)+q_current(4))*transl(0,0,robot.d(4))*transl(robot.a(4),0,0)*trotx(robot.alpha(4));
    T0_4 = T0_2 * T2_3 * T3_4;

    % Generate points along each arm (using those HTM and R) 
    z2 = 0:obst_radius/2:robot.d(3);
    arm2_2 = [zeros(size(z2));
              zeros(size(z2));
              z2;
              ones(size(z2))];
    arm0_2 = T0_2*arm2_2;
    arm0_2 = arm0_2(1:3,:);
        
    x4 = -robot.a(4):obst_radius/2:0;
    arm4_4 = [x4;
              zeros(size(x4));
              zeros(size(x4));
              ones(size(x4))];
    arm0_4 = T0_4*arm4_4;
    arm0_4 = arm0_4(1:3,:);
    
    % Compare Magnitude
    obst_center_2 = obst_location'+zeros(size(arm0_2));
    obst_center_4 = obst_location'+zeros(size(arm0_4));
    
    distance_2 = minus(arm0_2,obst_center_2);
    distance_4 = minus(arm0_4,obst_center_4);
    
    magnitude_2 = vecnorm(distance_2);
    magnitude_4 = vecnorm(distance_4);
    
    collision_2 = magnitude_2<=obst_radius;
    collision_4 = magnitude_4<=obst_radius;
    
    collision.location_2 = arm0_2(:,collision_2);
    collision.location_4 = arm0_4(:,collision_4);
    
    if ~isempty(collision.location_2)
        disp("Collision Detected on arm 2!!! Reconfiguring.")
        collision.occur = true;
    end
    if ~isempty(collision.location_4)
        disp("Collision Detected on arm 3!!! Reconfiguring.")
        collision.occur = true;
    end
        
end
