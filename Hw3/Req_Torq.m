function Tau = Req_Torq(Q,F)
%     syms a1 a2
    a1 = 1;
    a2 = 1;
    
    J_class = [-a2*sin(Q(1))*cos(Q(2))-a1*sin(Q(1))   -a2*sin(Q(2))*cos(Q(1));
            a2*cos(Q(1))*cos(Q(2))+a1*cos(Q(1))   -a2*sin(Q(2))*sin(Q(1));
            0                               -a2*sin(Q(1))*sin(Q(1))*cos(Q(2))-a2*cos(Q(1))*cos(Q(1))*cos(Q(2));
            0                               -sin(Q(1));
            0                               cos(Q(1));
            1                               0];
    
    Tau = J_class'*F;
end

