clear
close all
clc

% syms th ph
th = pi/3
ph = pi/3

Rxth = [1 0 0;
        0 cos(th) -sin(th);
        0 sin(th) cos(th)];
    
Ryph = [cos(ph) 0 sin(ph);
        0 1 0;
        -sin(ph) 0 cos(ph)];

Rzpi = [-1 0 0;
        0 -1 0;
        0 0 1];
%     [cos(pi) -sin(pi) 0;
%         sin(pi) cos(pi) 0;
%         0 0 1];

Rynph = [cos(ph) 0 -sin(ph);
        0 1 0;
        sin(ph) 0 cos(ph)];

    
Rxnth = [1 0 0;
        0 cos(th) sin(th);
        0 -sin(th) cos(th)];
    
ans1 = Rxth*Ryph*Rzpi*Rynph*Rxnth

ans2 = [-cos(2*ph)                  -2*cos(ph)*sin(ph)*sin(th)      cos(th)*sin(2*ph);
        -2*cos(ph)*sin(ph)*sin(th)  -(cos(th)^2)+cos(2*ph)*(sin(th)^2)  -cos(ph)^2*sin(2*th);
        cos(th)*sin(2*ph)           -cos(ph)^2*sin(2*th)            cos(ph)^2*cos(th)^2-cos(th)^2*sin(ph)^2-sin(th)^2]
