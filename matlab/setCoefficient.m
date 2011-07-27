    function H = setCoefficient(n, corners)
	H = zeros(n); %initialize empty matrix of size n
	
	%use determined coefficients to fill diagonal
	for i = 2:n-1
		H(i,i-1) = -1;
		H(i,i)   = 2;
		H(i,i+1) = -1;
	end
	
	%Ensure that the corners of the matrix are what we desire
	H(1,1) = corners;
	H(1,2) = -1;
	H(n,n) = corners;
	H(n,n-1) = -1;
	
end	