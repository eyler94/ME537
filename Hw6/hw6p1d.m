%hw6p1d

clear
close all
clc

syms m1 m2 m3 Ixx Iyy Izz q1 q2 q3 q1_d q2_d q3_d q1_dd q2_dd q3_dd g real

a = 0.2;
l = 0.4;

I = [Ixx 0 0;
     0 Iyy 0;
     0 0 Izz];
 
zvec = [0 0 1]';

o01com = [a*cos(q1) a*sin(q1) 0]';
o00 = [0 0 0]';
Jcom_1 = [cross(zvec,o01com-o00) zeros([3 2]); 
          zvec zeros([3 2])];
Jv1 = Jcom_1(1:3,1:3);
Jw1 = Jcom_1(4:6,1:3);

o02com = [l*cos(q1)+a*cos(q1+q2) l*sin(q1)+a*sin(q1+q2) 0]';
o01 = [l*cos(q1) l*sin(q1) 0]';
Jcom_2 = [cross(zvec,o02com-o00) cross(zvec,o02com-o01) zeros([3 1]);
          zvec zvec zeros([3 1])];
Jv2 = Jcom_2(1:3,1:3);
Jw2 = Jcom_2(4:6,1:3);

o03com = [l*cos(q1)+l*cos(q1+q2)+a*cos(q1+q2+q3) l*sin(q1)+l*sin(q1+q2)+a*sin(q1+q2+q3) 0]';
o02 = [l*cos(q1)+l*cos(q1+q2) l*sin(q1)+l*sin(q1+q2) 0]';
Jcom_3 = [cross(zvec,o03com-o00) cross(zvec,o03com-o01) cross(zvec,o03com-o02);
          zvec zvec zvec];
Jv3 = Jcom_3(1:3,1:3);
Jw3 = Jcom_3(4:6,1:3);


M_trans = m1*(Jv1')*Jv1 + m2*(Jv2')*Jv2 + m3*(Jv3')*Jv3;

M_rot = (Jw1')*I*Jw1+(Jw2')*I*Jw2+(Jw3')*I*Jw3;

M = M_trans + M_rot;

C = sym(zeros(3,3));

for k=1:3
    for j=1:3
        for i=1:3
            C(k,j) = C(k,j) + Christoffel(i,j,k,M,[q1 q2 q3]);
        end
    end
end


g = [0 9.81 0]';

r1com = [a*cos(q1); a*sin(q1); 0];
r2com = [l*cos(q1)+a*cos(q1+q2); l*sin(q1)+a*sin(q1+q2); 0];
r3com = [l*cos(q1)+l*cos(q1+q2)+a*cos(q1+q2+q3); l*sin(q1)+l*sin(q1+q2)+a*sin(q1+q2+q3); 0];

P = m1*(g')*r1com + m2*(g')*r2com + m3*(g')*r3com ;

G = sym(zeros(3,1));

G(1) = diff(P,q1);
G(2) = diff(P,q2);
G(3) = diff(P,q3);

M*[q1_dd; q2_dd; q3_dd] + C*[q1_d; q2_d; q3_d] + G


