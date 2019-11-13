%hw3p1bb

clc
close all
clear

mdl_puma560


error = zeros(1,100);

for iter=1:100
    deg = rand([1,6])*pi-pi/2;
    good = p560.fkine(deg);
    deg(2)=deg(2)+deg2rad(0.1);
    bad = p560.fkine(deg);
    error(iter) = norm(bad.t-good.t);
end
mean_error = mean(error)
max_error = max(error)


