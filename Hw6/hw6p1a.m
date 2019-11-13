%hw6p1a

clear
close all
clc

syms a b c x y z rho mass real

func1 = @(y,z) (y^2 + z^2);
func2 = @(x,z) (x^2 + z^2);
func3 = @(x,y) (x^2 + y^2);

% Diagonal terms
intx1 = int(func1,x,[0 a]);
intx2 = int(intx1,y,[0 b]);
Ixx =  int(intx2,z,[0 c]);

inty1 = int(func2,x,[0 a]);
inty2 = int(inty1,y,[0 b]);
Iyy =  int(inty2,z,[0 c]);

intz1 = int(func3,x,[0 a]);
intz2 = int(intz1,y,[0 b]);
Izz =  int(intz2,z,[0 c]);

% Cross diagonal terms
intxy1 = int(x*y*rho,x,[0 a]);
intxy2 = int(intxy1,y,[0 b]);
Ixy =  -int(intxy2,z,[0 c])*mass/(a*b*c*rho);
Iyx = Ixy;

intxz1 = int(x*z*rho,x,[0 a]);
intxz2 = int(intxz1,y,[0 b]);
Ixz =  -int(intxz2,z,[0 c])*mass/(a*b*c*rho);
Izx = Ixz;

intyz1 = int(y*z*rho,x,[0 a]);
intyz2 = int(intyz1,y,[0 b]);
Iyz =  -int(intyz2,z,[0 c])*mass/(a*b*c*rho);
Izy = Iyz;

I = [Ixx Ixy Ixz;
     Iyx Iyy Iyz;
     Izx Izy Izz]