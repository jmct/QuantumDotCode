function results = QDSim2(shapes)

	n = 50;
	vMax = 1000;

	elecStepSize = 5;
	elecFieldMin = 0;
	elecFieldMax = 10;

	%delta is the size of the spacing between sample points
	%here we have defined L to be 1 in all three dimensions
	delta = 1/(n-1);
	K = (1/(delta^2))*setupK3(n);
	
        %I don't think that I'll need to resize the shapes using the new format
	%shapes = resizeShapes(shapes, n);

	%setup the file for where we are saving out results
	%you'd have to change this if using it anywhere else
	%as MATLAB does not allow for us to use relational
	%paths in creating a file (it should...)
	fileName = sprintf('log/%d_%d_%d-%d.csv', n,vMax,elecFieldMin, elecFieldMax);
	fileID = fopen(fileName, 'w');
	temp = 0;
	
	%numberOfiterations is used to ensure that we allocate
	%the appropriate size for the array of results
	numberOfIterations = (elecFieldMax-(elecFieldMin))/elecStepSize;
	results = zeros(numberOfIterations,4);
	count = 1;

	for i = elecFieldMin:elecStepSize:elecFieldMax
		
	    V = calcVPotential(shapes,i, n, vMax);
	    H = K + V;
	    eigsAns = eigs(H,2,'SM');
	    temp = eigsAns(1) - eigsAns(2);
	    fprintf(fileID,'%f,%f,%d,%f\n',eigsAns(1), eigsAns(2), i, temp);
	    results(count,:) = [eigsAns(1),eigsAns(2), i,temp];
		i
		count = count + 1
	end

	%close the results file
	fclose(fileID);
end
