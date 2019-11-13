clc
close all
clear

%definitions
willpack = ManWillpack;
warning("off")

q_init = [0 0 0 0];
goal = [0, 2, 4];
obst_location = [0, 3, 2];
obst_radius = 1;

q_s = compute_robot_path(willpack,q_init,goal,obst_location,obst_radius);

warning("on")
