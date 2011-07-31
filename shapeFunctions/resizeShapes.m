%this function takes a cell array of shapes
%and the sample size of the sample cube and 
%resizes the shapes accordingly
%
%So if a shape was defined to have a length of 50 (out of 100)
%and the sample size was 60, then the new shape will have a 
%length of 30.
function shapes2 = resizeShapes(shapes1, n)
	
	shapes2 = cell(size(shapes1));
	
	scaleFactor = n/100;
	
	for i = 1:size(shapes1, 2)
		shapes2{i} = [shapes1{i}(1), shapes1{i}(2:size(shapes1{i},2)).*scaleFactor];
	end



end