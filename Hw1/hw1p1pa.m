clear
close all
clc

%part a
cuber

%part b
%Done!

%part c

for i=1:45
    
    htm = [rotx(i,'deg') zeros([3,1]);
           zeros([1,3]) 1];

    cuberHTM(htm)
    pause(1/24)
end
pause(1)
%part d

for i=1:45
    Rot = eye(3);
    %rot in x
    Rot = rotx(i,'deg')*Rot;
    %rot in y
    Rot = roty(i,'deg')*Rot;
    %rot in z
    Rot = rotz(i,'deg')*Rot;
    htm = [Rot zeros([3,1]);
           zeros([1,3]) 1];

    cuberHTM(htm)
    pause(1/24)

end

