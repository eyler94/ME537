function q_s = compute_robot_path(robot,q_init,goal,obst_location,obst_radius)
    %%%Ideas for how to make this work:
    % point = goal
    % Iterate toward point
    % If collision detected****:
    %       change point to specific point in direction away from sphere,
    %       towards goal*****
    % If position == point:
    %       if point == goal:
    %           done
    %       else:
    %           point = goal
    % **** To detect collision, iteratively check points along the joints lengths relative to the
    %       obst_rad. Use jacob0 of given joint-point and check distance to obst_location relative to
    %       obst_radius. if yes, return bool=true, else bool=false.
    % ***** This will probably be something like a potential field trending
    % towards the goal while avoiding the obstacle. Maybe add the two 
    % vectors (between the goal and the current location)
    % and then adding the difference between them? After thinking about
    % this, this is equal to the 2*obst_location->collision_point. 
    % ************ Correction************
    % I've opted for the safest path. First, try the easiest route, if a 
    % collision occurs, reset and compute the opposite of
    % the obstacle with respect to the top of the first joint. Safely move
    % the arm to this location using x, y, then z. Then begin a most
    % likely error free path to the final destination.
    % The code will do something like the following:
    % 
    % xi_good = ~obstacle
    % q_x = ikdp(xi_good)
    % q_y = ikdp(xi_good)
    % q_z = ikdp(xi_good)
    % q_trip = ikdp(xi_des)
    % q_s = [q_x q_y q_z q_trip]
    %%%
    
    % Computing q_trip
    info_trip = IK_Damped_PseudoInverse_test(robot, q_init', goal', obst_location, obst_radius,0.01);
    if ~info_trip.collision_occured
        q_s = info_trip.q_s;
        
        robot.plot(q_s(:,end)')
        hold on
        plot3(info_trip.x,info_trip.y,info_trip.z)
        [x,y,z] = sphere;
        surf(x*obst_radius+obst_location(1),y*obst_radius+obst_location(2),z*obst_radius+obst_location(3))
        xlabel('x')
        ylabel('y')
        zlabel('z')
    else
        xi_good = [-obst_location(1); -obst_location(2); 8-obst_location(3)];
        if xi_good(1) == 0
            xi_good(1) = 2;
        end
        xi_orig = robot.fkine(q_init).t;

        % Computing q_x
        Tx = SE3([xi_good(1),xi_orig(2),xi_orig(3)]);
        info_x = IK_Damped_PseudoInverse_test(robot, q_init', Tx.t, obst_location, obst_radius,1);
        q_x = info_x.q_s;

        % Computing q_y
        Ty = SE3([xi_good(1),xi_good(2),xi_orig(3)]);
        info_y = IK_Damped_PseudoInverse_test(robot, q_x(:,end), Ty.t, obst_location, obst_radius,1);
        q_y = info_y.q_s;

        % Computing q_z
        Tz = SE3([xi_good(1),xi_good(2),xi_good(3)]);
        info_z = IK_Damped_PseudoInverse_test(robot, q_y(:,end), Tz.t, obst_location, obst_radius,1);
        q_z = info_z.q_s;

        % Computing q_trip
        info_trip = IK_Damped_PseudoInverse_test(robot, q_z(:,end), goal', obst_location, obst_radius,0.01);
        q_trip = info_trip.q_s;


        x = [info_x.x info_y.x info_z.x info_trip.x];
        y = [info_x.y info_y.y info_z.y info_trip.y];
        z = [info_x.z info_y.z info_z.z info_trip.z];

        robot.plot(q_trip(:,end)')
        hold on
        plot3(x,y,z)
        [x,y,z] = sphere;
        surf(x*obst_radius+obst_location(1),y*obst_radius+obst_location(2),z*obst_radius+obst_location(3))
        xlabel('x')
        ylabel('y')
        zlabel('z')

        q_s = [q_x q_y q_z q_trip];
    end    
end