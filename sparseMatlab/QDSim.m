function results = QDSim(n,vMax,shapes, elecFieldMin, elecFieldMax, elecStepSize)

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
	fileName = sprintf('/usr/jmc512/QuantumDotCode/sparseMatlab/%d_%d_%d-%d.csv', ...
						n,vMax,elecFieldMin, elecFieldMax);
	fileID = fopen(fileName, 'w');
	temp = 0;
	
	%numberOfiterations is used to ensure that we allocate
	%the appropriate size for the array of results
	numberOfIterations = (elecFieldMax-(elecFieldMin-1))/elecStepSize;
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


	%Below is the plotting of the graphs I'm currently interested in
	%a good move would be to create a plotting function and pass the results
	%array and that way the desired plots can be defined and modified in one place
	figure, close
	
	fileName = sprintf('%d_%d_%d-%d', ...
						n,vMax,elecFieldMin, elecFieldMax);

	plot(results(:,3),results(:,1));
	saveas(gcf, fileName, 'png');

	figure, close
	
	fileName = sprintf('%d_%d_%d-%dDif', ...
						n,vMax,elecFieldMin, elecFieldMax);

	plot(results(:,3),results(:,4));
	saveas(gcf, fileName, 'png');

	figure, close
end
