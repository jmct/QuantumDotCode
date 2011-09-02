%this function takes a cell array of shapes
%and the sample size of the sample cube and 
%resizes the shapes accordingly
%
%So if a shape was defined to have a length of 50 (out of 100)
%and the sample size was 60, then the new shape will have a 
%length of 30.
function shapes2 = resizeShapes(shapes1, n)
	
	shapes2 = cell(size(shapes1));
	
	scaleFactor = (n-1)/100;
	
	for i = 1:size(shapes1, 2)
        if (shapes1{i}(1) == 1)
            shapes2{i} = resizeSphere(shapes1{i}, scaleFactor);
        elseif (shapes1{i}(1) == 2)
            shapes2{i} = resizeCube(shapes1{i}, scaleFactor);
        elseif (shapes1{i}(1) == 3)
            shapes2{i} = resizeCyl(shapes1{i}, scaleFactor);
        end
	end



end