function isIn = isInShape(x,y,z,shape)
	%shape will be a vector of the form:
	%[type, param1, param2, param3,...paramN]
	%where type is the indicator of which shape
	%this represents and the rest of the vector 
	%contains the parameters for the specified shape
	
	if (shape(1) == 1)
		isIn = isInSphere(x,y,z, 2:size(shape,2));
	elseif (shape(1) == 2)
		isIn = isInRecPrism(x,y,z, 2:size(shape,2));
	elseif (shape(1) == 3)
		isIn = isInCylinder(x,y,z, 2:size(shape,2));
	end
	
end