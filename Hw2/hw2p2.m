clc
clear
close all

R0 = [1 0 0;
      0 1 0;
      0 0 1];

R01 = [cos(pi/2)    0   sin(pi/2);
       0            1   0        ;
      -sin(pi/2)    0   cos(pi/2)];
  
R12 = [cos(pi/4) -sin(pi/4) 0;
       sin(pi/4) cos(pi/4)  0;
       0         0          1];
   
R = R01*R12;

theta = acos((trace(R)-1)/2)

k = 1/(2*sin(theta))*[R(3,2)-R(2,3);
                      R(1,3)-R(3,1);
                      R(2,1)-R(1,2)]
                  
trplot(R0)
hold on
trplot(R,'color','green')
plot3([0 k(1)],[0 k(2)],[0 k(3)],'--')

s = cos(theta/2)

V = k*sin(theta/2)

