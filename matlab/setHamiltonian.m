function H = setHamiltonian(n, corners)
	H = zeros(n);
	for i = 2:n-1
		H(i,i-1) = 1;
		H(i,i)   = 2;
		H(i,i+1) = 1;
	end
	
	H(1,1) = corners;
	H(1,2) = 1;
	H(n,n) = corners;
	H(n,n-1) = 1;
	
end	