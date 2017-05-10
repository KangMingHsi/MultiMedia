function bgImage = drawAndFillPolygon( bgImage, ctrlPointList, outlineVertexList, ctrlPointScattered, polygonPlotted, filled )

maskColor  = [0.25 0.51 0.51] ; %Aquamarine
ctrlPointColor = [0.4 0.7 1.0]; %Blue
outlineColor = [0.0 0.0 0.0] ; %Black

[h, w, ~] = size(bgImage);

%% Fill the polygon (Alpha blending)
if filled
	[imgX,imgY] = meshgrid(1:h,1:w);
	imgXY = imgX;
	imgXY(:,:,2) = imgY;
	imgPixN = h*w;
	imgXYList = reshape(imgXY, [ imgPixN, 2 ]);

	isInShape = inpolygon( imgXYList(:,1), imgXYList(:,2), outlineVertexList(:,1), outlineVertexList(:,2) );
	for pixI = 1 : imgPixN
		if isInShape(pixI)
			xCoord = imgXYList(pixI,1);
			yCoord = imgXYList(pixI,2);
			bgImage( yCoord, xCoord, : ) = reshape(bgImage( yCoord, xCoord, : ), [1 3])*0.6  +  maskColor*0.4;
		end
	end
end
%% Draw background
imshow(bgImage);

%% Draw control points and outline of polygon
axis equal
hold on
if polygonPlotted
	line( [outlineVertexList(:,1);outlineVertexList(1,1)], [outlineVertexList(:,2);outlineVertexList(1,2)], 'Color', outlineColor, 'LineWidth',2);
end
if ctrlPointScattered
	scatter( ctrlPointList(:,1), ctrlPointList(:,2), 25, 'MarkerEdgeColor', ctrlPointColor, 'LineWidth',3 );
end
end

