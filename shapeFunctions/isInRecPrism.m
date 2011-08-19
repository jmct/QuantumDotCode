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
    
	
	xRange = cyl(4:6) - cyl(1:3);
	t_min = ( (dot([x,y,z], xRange) - dot(cyl(1:3), xRange)) / ...
				   dot(xRange, xRange));
				
	%because we've used a parametric representation of the
	%center line t_min is a good indicator of whether the 
	%test point is outside the 'length' of the cylinder.
	%if t_min is < 0 or > 1 then it's not within the cylinder
				
	if (t_min < 0 || t_min > 1)
		isIn = 0;
		return;
	end
	

end