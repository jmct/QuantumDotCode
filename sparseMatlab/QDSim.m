function results = QDSim(L,n,vMax,shapes, elecFieldMin, elecFieldMax, elecStepSize)

	K = setupK3(n);
	
	shapes = resizeShapes(shapes, n);

	fileName = sprintf('/usr/jmc512/QuantumDotCode/sparseMatlab/%d_%d_%d_%d-%d.csv', ...
						L,n,vMax,elecFieldMin, elecFieldMax);
	
	fileID = fopen(fileName, 'a');
	temp = 0;
	
	numberOfIterations = (elecFieldMax-(elecFieldMin-1))/elecStepSize;
	results = zeros(numberOfIterations,4);
	count = 1;

	for i = elecFieldMin:elecStepSize:elecFieldMax
		
	    V = calcVPotential(shapes,i, n, vMax);
	    H = K + V;
	    tic
	    eigsAns = eigs(H,2,'SM');
	    toc
	    temp = eigsAns(1) - eigsAns(2);
	    fprintf(fileID,'%f,%f,%d,%f\n',eigsAns(1), eigsAns(2), i, temp);
	    results(count,:) = [eigsAns(1),eigsAns(2), i,temp];
		i
		count = count + 1
	end

	fclose(fileID);

	figure, close
	
	fileName = sprintf('%d_%d_%d_%d-%d', ...
						L,n,vMax,elecFieldMin, elecFieldMax);

	plot(results(:,3),results(:,1));
	saveas(gcf, fileName, 'png');

	figure, close
	
	fileName = sprintf('%d_%d_%d_%d-%dDif', ...
						L,n,vMax,elecFieldMin, elecFieldMax);

	plot(results(:,3),results(:,4));
	saveas(gcf, fileName, 'png');

end