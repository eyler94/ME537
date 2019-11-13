function q = IK_Damped_PseudoInverse(robot, q1, xi_des)
    k = diag([1 1 1 1 1 1]);
    kd = 0.01;
    dt = 0.01;
    q = q1;
    error_lin = xi_des - robot.fkine(q).t;
    error = [error_lin; 0; 0; 0];
    counter = 0;
    epsilon = 0.001;
    while norm(error)> epsilon && counter < 1000
        J = robot.Jacob0(q);
        q_dot = J'/(J*J'+kd^2*eye(6))*k*error;
        q = q + q_dot*dt;
        error_lin = xi_des - robot.fkine(q).t;
        error = [error_lin; 0; 0; 0];
        counter = counter + 1;
    end
end

