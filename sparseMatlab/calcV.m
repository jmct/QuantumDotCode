function V= calcV(shapes, numShapes)
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

	indeces = zeros(100^3,1);

	for z = 1:100
	    for y = 1:100
	        for x = 1:100
		    for i = 1:numShapes(1)
		    	if (isInSphere(x,y,z,shapes{1,i}))
			    
			end
	            end
		end
	    end
	end





end
