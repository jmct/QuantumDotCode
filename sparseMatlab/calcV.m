function V = calcV(shapes, n, vMax)
	%the shapes structure is a cell array containing
	%all the defined shapes

	indeces = zeros(n^3,1);
	%indeces will be the diagonal of the V matrix
	
	shapes = resizeShapes(shapes, n);
	
	count = 1;
	hit = 0; %if the coordinate is within a shape it is a 'hit'
	%hits will remove the index from the indeces vector


	for z = 1:n
	    for y = 1:n
	        for x = 1:n
				indx = coordToIndex3D(x,y,z,n);
				indeces(count) = indx;
				hit = 0;
				
				for i = 1:size(size(shapes,2))
					if (isInShape(x,y,z, shapes{i}))
						hit = 1;
					end
				end
				
				if (hit == 0)
					count = count + 1;
				end
			end
		end
	end
	
	V = sparse(indeces(1:(count-1)), indeces(1:(count-1)), vMax);


end
