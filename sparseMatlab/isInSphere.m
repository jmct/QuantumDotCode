function isIn = isInSphere(x,y,z, sphr)
	
	%sphr will be a vector containing the
	%center of the sphere and the radius
	%in the form [centerX,centerY,centerZ, radius]

	dst = sqrt((x-sphr(1))^2 + (y-sphr(2))^2 + (z-sphr(3))^2);
	%where sphr(1), sphr(2), and sphr(3) are the x,y, and z,
	%respectively, coordinates of the sphere's center
	
	
	if (dst <= sphr(4)) %where sphr(4) is the radius of the sphere
		isIn = 1;
	else
		isIn = 0;
	end
end