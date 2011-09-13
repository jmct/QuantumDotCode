function [point1, point2, point3, point5] = rotatePrism(points, xDegrees, yDegrees, zDegrees, n)
	 %find the amount to shift the origin by
	 shift = -((n - 1) / 2);

         %shift the origin of the sample cube
	 [point1, point2, point3, point5] = [point1, point2, point3, point5] - shift;

	 rotationX = [1, 0 , 0; 0, cos(xDegrees), -sin(xDegrees); 0, sin(xDegrees), cos(xDegrees)];
         rotationY = [cos(yDegrees), 0 , sin(yDegrees); 0, 1, 0; -sin(xDegrees), 0, cos(xDegrees)];
         rotationZ = [cos(xDegrees), -sin(xDegrees), 0; sin(xDegrees), cos(xDegrees), 0; 0, 0, 1];

	 fullRotation = rotationX*rotationY*rotationZ;

	 for i = 0:3
		 newPoints{i + 1} = fullRotation * points((i*3) + 1:(i + 1) * 3)';
	 end

         point1 = newPoints{1}';
	 point2 = newPoints{2}';
	 point3 = newPoints{3}';
	 point5 = newPoints{5}';
end
