function J = stanf_jacob(Q)
    mdl_stanford

A1=stanf.A(1,Q(1));
A2=stanf.A(1:2,Q(1:2));
A3=stanf.A(1:3,Q(1:3));
A4=stanf.A(1:4,Q(1:4));
A5=stanf.A(1:5,Q(1:5));
A6=stanf.A(1:6,Q(1:6));

T1 = A1;
T2 = A2;
T3 = A3;
T4 = A4;
T5 = A5;
T6 = A6;

Z00 = [0;0;1];
Z01 = T1.R;
Z01 = Z01(:,3);
Z02 = T2.R;
Z02 = Z02(:,3);
Z03 = T3.R;
Z03 = Z03(:,3);
Z04 = T4.R;
Z04 = Z04(:,3);
Z05 = T5.R;
Z05 = Z05(:,3);

O00 = [0;0;0];
O01 = T1.t;
O02 = T2.t;
O03 = T3.t;
O04 = T4.t;
O05 = T5.t;
O06 = T6.t;


J = [cross(Z00,O06-O00) cross(Z01,O06-O01) Z02 cross(Z03,O06-O03) cross(Z04,O06-O04) cross(Z05,O06-O05);
     Z00                Z01                zeros([3,1])                Z03                Z04                Z05];

end

