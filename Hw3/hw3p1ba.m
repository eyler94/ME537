%hw3p1ba

clc
close all
clear

mdl_puma560


p560.links(2).a = p560.links(2).a + 0.0005;
error = zeros(1,100);

for iter=1:100
    deg = rand([1,6])*pi-pi/2;
    p560.links(2).a = p560.links(2).a - 0.0005;
    good = p560.fkine(deg);
    p560.links(2).a = p560.links(2).a + 0.0005;
    bad = p560.fkine(deg);
    error(iter) = norm(bad.t-good.t);
end
mean_error = mean(error)
max_error = max(error)


