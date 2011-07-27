function isIn = isInCube(x,y,z, cube) 
	
	%cube should be a vector containing 
	%[originX, originY, originZ, length, width, depth]
	
	if ((x - cube(1)) < 0 || (x - cube(1)) > cube(4) || ...
	    (y - cube(2)) < 0 || (y - cube(2)) > cube(5) || ...
	    (z - cube(3)) < 0 || (z - cube(3)) > cube(6))
		isIn = 0;
	else
		isIn = 1;
	end
end