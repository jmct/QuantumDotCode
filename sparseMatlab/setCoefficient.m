    function K = setCoefficient(n, corners)
	K = zeros(n); %initialize empty matrix of size n
	
	%use determined coefficients to fill diagonal
	for i = 2:n-1
		K(i,i-1) = -1;
		K(i,i)   = 2;
		K(i,i+1) = -1;
	end
	
	%Ensure that the corners of the matrix are what we desire
	%old version that worked:
	K(1,1) = corners;
	K(1,2) = -1;
	K(n,n) = corners;
	K(n,n-1) = -1;

	
	K = sparse(K);
	
end	
