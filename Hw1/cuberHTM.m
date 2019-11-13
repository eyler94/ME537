function cuberHTM(HTM)
    x = [-1 1 1 -1 -1 -1 1 1 1 1 1 1 -1 -1 -1 -1];
    y = [-1 -1 1 1 -1 -1 -1 -1 -1 1 1 1 1 1 1 -1];
    z = [-1 -1 -1 -1 -1 1 1 -1 1 1 -1 1 1 -1 1 1];
    
    points = [x; y; z; ones([1 16])];
    
    new_points = HTM*points;
    
    
    plot3(new_points(1,:),new_points(2,:),new_points(3,:))
    axis([-2 2 -2 2 -2 2])
end