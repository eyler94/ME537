function Cijk = Christoffel(i,j,k,M,q)
    %%% i,j,k are indices of the Christoffel Matrix, M is the inertia
    %%% matrix, and q is a vector of joint variables
    Cijk = 0.5*(diff(M(k,j),q(i)) + diff(M(k,i),q(j)) - diff(M(i,j),q(k)));

end