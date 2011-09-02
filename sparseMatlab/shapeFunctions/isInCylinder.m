function isIn = isInCylinder(x,y,z, cyl)
	%cylinder is a vector of the form
	%[x1,y1,z1, x2,y2,z2, radius] where the points
	%are the center points on each end
	
	
	%project the point onto the center line of the
	%cylinder to find the closest point on the
	%center line to the 'new' point
	%t_min is the value of the point for the set
	%of parametric equations for the line.
	
	cylRange = cyl(4:6) - cyl(1:3);
	t_min = ( (dot([x,y,z], cylRange) - dot(cyl(1:3), cylRange)) / ...
				   dot(cylRange, cylRange));
				
	%because we've used a parametric representation of the
	%center line t_min is a good indicator of whether the 
	%test point is outside the 'length' of the cylinder.
	%if t_min is < 0 or > 1 then it's not within the cylinder
				
	if (t_min < 0 || t_min > 1)
		isIn = 0;
		return;
	end
	
	%now that we have the projected point we can find the distance from
	
	pointOnLine = parametricPoint(cyl, t_min);
	difference = [x,y,z] - pointOnLine;
	distFromLine = sqrt( dot(difference, difference));
	
	if (distFromLine > cyl(7))
		isIn = 0;
	else
		isIn = 1;
	end


	function p = parametricPoint(cyl, t)
		p = zeros(size(cyl(1:3)));
		
		cylRange = cyl(4:6) - cyl(1:3);
		p(1) = cyl(1) + t * cylRange(1);
		p(2) = cyl(2) + t * cylRange(2);
		p(3) = cyl(3) + t * cylRange(3);
	end
		
		
end