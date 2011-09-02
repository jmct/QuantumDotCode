function result = gridJob(jobNumber)
	addpath('usr/jmc512/QuantumDotCode/sparseMatlab/shapeFunctions/');


	n = 50;
	vMax = 1000;
	

	elecFieldMax = mod(jobNumber - 1, 501);
	if (jobNumber <= 501)
		shapes = {[2,.1,.1,.1,.8,.8,.8]};
		fileName = sprintf('log/cube-%d.csv', elecFieldMax);
	elseif(jobNumber > 501 && jobNumber <= 1002)
		shapes = {[1,.5,.5,.5,.45]};
		fileName = sprintf('log/sphere-%d.csv', elecFieldMax);
	elseif(jobNumber > 1002 && jobNumber <= 1503)
		shapes = {[3,.1,.5,.5,.9,.5,.5,.45]};
		fileName = sprintf('log/cylinder-%d.csv', elecFieldMax);
	end

	%delta is the size of the spacing between sample points
	%here we have defined L to be 1 in all three dimensions
	delta = 1/(n-1);
	K = (1/(delta^2))*setupK3(n);

	%setup the file for where we are saving out results
	%you'd have to change this if using it anywhere else
	%as MATLAB does not allow for us to use relational
	%paths in creating a file (it should...)
	fileID = fopen(fileName, 'w');
	temp = 0;
	
	V = calcVPotential(shapes,elecFieldMax, n, vMax);
	H = K + V;
	eigsAns = eigs(H,2,'SM');
	temp = eigsAns(1) - eigsAns(2);
	fprintf(fileID,'%f,%f,%d,%f\n',eigsAns(1), eigsAns(2), elecFieldMax, temp);
end
