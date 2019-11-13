function info = IK_Damped_PseudoInverse_test(robot, q1, xi_des, obst_location, obst_radius, epsilon)
    k = diag([1 1 1 1 1 1]);
    kd = 0.01;
    dt = 0.01;
    q = q1;
    xi_cur = robot.fkine(q).t;
    x_path = xi_cur(1);
    y_path = xi_cur(2);
    z_path = xi_cur(3);
    error_lin = xi_des - xi_cur;
    error = [error_lin; 0; 0; 0];
    counter = 0;
    q_s = q;
    info.collision_occured = false;
    while norm(error)> epsilon && counter < 1000
        J = robot.jacob0(q);
        q_dot = J'/(J*J'+kd^2*eye(6))*k*error;
        q = q + q_dot*dt;
        xi_cur = robot.fkine(q).t;
        x_path = [x_path xi_cur(1)];
        y_path = [y_path xi_cur(2)];
        z_path = [z_path xi_cur(3)];
        error_lin = xi_des - xi_cur;
        error = [error_lin; 0; 0; 0];
        counter = counter + 1;
        collision = Detect_Collision(robot,q,obst_location,obst_radius);
        if collision.occur
            info.collision_occured = true;
            break
        end
        q_s = [q_s q];
    end
    info.q_s = q_s;
    info.x = x_path;
    info.y = y_path;
    info.z = z_path;
    
end

%%% Plotter for Debugging
%         robot.plot(q')
%         hold on
%         plot3(xi_des(1),xi_des(2),xi_des(3),'*','LineWidth',5)    
%         [x,y,z] = sphere;
%         surf(x*obst_radius+obst_location(1),y*obst_radius+obst_location(2),z*obst_radius+obst_location(3))
%         xlabel('x')
%         ylabel('y')
%         zlabel('z')
%         hold off

