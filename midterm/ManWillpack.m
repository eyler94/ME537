function robot = ManWillpack()
    clear L
    %%%%%%%%%%% theta,  d,  a,  alpha,  rev or pris, offset
    L(1) = Link([pi/2   4   0   pi/2    0   pi/2], 'standard');
    L(2) = Link([pi/6   0   0   pi/2    0   pi/6], 'standard');
    L(3) = Link([0      4   0   pi/2    0   0], 'standard');
    L(4) = Link([pi/6   0   2   pi/2    0   pi/6], 'standard');

    robot = SerialLink(L,'name','Willpack');
end
