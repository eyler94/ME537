clear
close all
clc

syms th ph

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
    
% simplify(Rxth*Ryph*Rzpi*Rynph*Rxnth)

Rxth*Ryph;
Rzpi*Rynph



