function V = calcVPotential(shapes, elecFieldMax, n, vMax)
	%the shapes structure is a cell array containing
	%all the defined shapes

	indeces = zeros(n^3,1);
	%indeces will be the diagonal of the V matrix
	
	count = 1;
	hit = 0; %if the coordinate is within a shape it is a 'hit'
	%hits will remove the index from the indeces vector
	
	shapes = resizeShapes(shapes, n);

	m = elecFieldMax/n;
	elecPot = 0;
	%this calculates the slope of the plane for the electric field
	%so if there are 100 sample points the electric potential of a 
	%point inside the quantum dot is m*x + b where b = -1 so that 
	%the electric potential of a point at x = 1 is 0

	for z = 1:n
		for y = 1:n
			for x = 1:n
				indx = coordToIndex3D(x,y,z,n);
				hit = 0;
				elecPot = m*x - 1;
				
				
				%go through each shape
				for i = 1:size(shapes,2)
					if (isInShape(x,y,z, shapes{i}))
						indeces(indx) = elecPot;
						hit = 1;
					end
				end
				
				if (hit == 0)
					indeces(indx) = vMax;
				end				
			end
		end
	end
	
	V = sparse(1:n^3, 1:n^3, indeces);


end
