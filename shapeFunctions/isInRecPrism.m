function isIn = isInRecPrism(x,y,z, recPrism)
    %cube should be a vector containing
    %[originX, originY, originZ, length, height, depth]
    %project the point onto the center line of the
    %cylinder to find the closest point on the
    %center line to the 'new' point
    %t_min is the value of the point for the set
    %of parametric equations for the line.
    
    point2 = recPrism(1:3) + [recPrism(4), 0,0];
    point3 = recPrism(1:3) + [0,recPrism(5), 0];
    point5 = recPrism(1:3) + [recPrism(4), 0,0];
    
    %now we will project the point onto each line from the 
    %origin to the three points we just defined. 
    xRange = point2 - recPrism(1:3);
    t_minX = ( (dot([x,y,z], xRange) - dot(recPrism(1:3), xRange)) / ...
				   dot(xRange, xRange));

    yRange = point3 - recPrism(1:3);
    t_minY = ( (dot([x,y,z], yRange) - dot(recPrism(1:3), yRange)) / ...
				   dot(yRange, yRange));
                       
    zRange = point5 - recPrism(1:3);
    t_minZ = ( (dot([x,y,z], zRange) - dot(recPrism(1:3), zRange)) / ...
				   dot(zRange, zRange));

    %because we've used a parametric representation of the
    %center line t_min is a good indicator of whether the 
    %test point is outside the 'length' of the prism.
    %if t_min is < 0 or > 1 then it's not within the prism
				
    if ((t_minX <= 0 || t_minX >= 1) || (t_minY <= 0 || t_minY >= 1) || ...
        (t_minZ <= 0 || t_minZ >= 1) )
        isIn = 0;
        return;
    else 
	isIn = 1;
    end
end
