function V = calcV(shapes, numShapes, elecFieldMax, n)
	%the shapes structure is a cell array where the
	%first dimension corresponds to the primitives
	%as follows: 1->circle, 2->cube, 3->cylinder
	%and 4->pyramid

	%the second dimension is for each instance of 
	%the relavent primitive. So shapes{2,4} would
	%correspond to the 4th cube

	%the numShapes vector holds the number of 
	%instances for each shape where the position
	%in the vector relates to the type of primitive
	%(same order as the first dimension of the cell 
	%array)

	indeces = zeros(n^3,1);
	%indeces will be the diagonal of the V matrix
	
	count = 1;
	hit = 0; %if the coordinate is within a shape it is a 'hit'
	%hits will remove the index from the indeces vector

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
				
				
				%go through each Sphere
			    for i = 1:numShapes(1)
			    	if (isInSphere(x,y,z,shapes{1,i}))
			    		hit = 1;
					end
		        end
		
				%each Cube
				for i = 1:numShapes(2)
					if (isInCube(x,y,z,shapes{2,i}))
						hit = 1;
					end
				end
				
				%each cylinder
				for i = 1:numShapes(3)
					if (isInCylinder(x,y,z,shapes{3,i}))
						hit = 1;
					end
				end
				
				if (hit == 0)
					indeces(indx) = realmax;
				end
				
			end
	    end
	end
	
	V = sparse(indeces(1:(count-1)), indeces(1:(count-1)), realmax);


end
