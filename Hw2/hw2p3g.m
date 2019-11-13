clear
clc
close all


d1 = 1/3;
d4 = 1/3;
d6 = 1/3;

a2 = 1/3;

p2 = pi/2;

%%%%%%%%%%% theta, d, a, alpha, rev or pris, offset
L(1) = Link([0 d1 0 p2 0 0], 'standard');
L(2) = Link([0 0 a2 0 0 0], 'standard');
L(3) = Link([0 0 0 p2 0 p2], 'standard');
L(4) = Link([0 d4 0 p2 0 p2], 'standard');
L(5) = Link([0 0 0 -p2 0 0], 'standard');
L(6) = Link([0 d6 0 0 0 0], 'standard');
    
willpack = SerialLink(L,'name','Willpack');


syms th1 th2 th3 th4 th5 

i=0;
divisor = 4;
%1=144 2=2304 3=6750 4=24696

iters = 24696;
points = zeros([3,iters]);
deg = zeros([iters,6]);

for deg1=-pi/16:pi/64:pi/16 % 4 iterations
    for deg2=-7*pi/8:pi/divisor:7*pi/8
        for deg3=-3*pi/4:pi/divisor:3*pi/4
            for deg4=-3*pi/4:pi/divisor:3*pi/4
                for deg5=-3*pi/4:pi/divisor:3*pi/4
                    i=i+1;
                    deg(i,:)=[deg1, deg2, deg3, deg4, deg5, 0];
                    points(:,i)=willpack.fkine(deg(i,:))*[0;0;0];
                end
            end    
        end
    end
end

willpack.plot([0 0 0 0 0 0])
hold on

plot3(points(1,:),points(2,:),points(3,:),'x')

% This represents a small segment of the first degree's motion, as it is
% symmetric.
