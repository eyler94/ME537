%hw5p3

clear
close all
clc

syms psi psi_d theta theta_d phi phi_d 'real'

Rpsi = rotz(psi);
DRpsi = diff(Rpsi,1,psi)*psi_d;
DRpsi = skew([0,0,1])*Rpsi*psi_d;

Rtheta = roty(theta);
DRtheta = diff(Rtheta,1,theta)*theta_d;
DRtheta = skew([0,1,0])*Rtheta*theta_d;

Rphi = rotz(phi);
DRphi = diff(Rphi,1,phi)*phi_d;
DRphi = skew([0,0,1])*Rphi*phi_d;

omega_x = skew([cos(psi)*sin(theta)*phi_d-sin(psi)*theta_d, sin(psi)*sin(theta)*phi_d+cos(psi)*theta_d, psi_d+cos(theta)*phi_d]);

lhs = DRpsi*Rtheta*Rphi+Rpsi*DRtheta*Rphi+Rpsi*Rtheta*DRphi;
rhs = omega_x*Rpsi*Rtheta*Rphi;

diff = simplify(rhs-lhs)

