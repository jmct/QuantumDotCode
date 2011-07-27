function V = calcVFull(shapes, n)
	%the shapes structure is a cell array containing
	%all the defined shapes

	V = zeros(n^3);
	%indeces will be the diagonal of the V matrix


	for z = 1:n
		for y = 1:n
			for x = 1:n
				indx = coordToIndex3D(x,y,z,n);
				hit = 0;
				
				for i = 1:size(size(shapes,2))
					if (isInShape(x,y,z, shapes{i}))
						V(indx,indx) = 0;
					else
						V(indx,indx) = realmax;
					end
				end
			end
		end
    end


end
