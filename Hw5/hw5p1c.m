%hw5p1c

clear
close all
clc

a = [1 0 0;
     0 1 0;
     0 0 1];
 
b = [0 -1 0;
     1  0 0;
     0  0 1];
 
Rab = [0 -1 0;
       1  0 0;
       0  0 1];
   
Rba = [0 1 0;
      -1 0 0;
       0 0 1];

tr2angvec(Rab)
tr2angvec(Rba)

% They're the same, just opposite angles/directions
Twist(r2t(Rab))
Twist(r2t(Rba))

