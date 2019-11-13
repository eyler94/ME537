function [X, Y, Z] = circle(rad,height)
    theta = -pi:0.01:pi;
    X = rad*cos(theta);
    Y = rad*sin(theta);
    Z = height*ones(size(theta));
end
    