% clear all; close all; clc;
% 
rbImage = im2double(imread('icon_back.png'));
[h, w, ~] = size(rbImage);

imshow(rbImage);
% 
% L_sample = 40;
H_sample = 100;
%% Mouse input
xlabel ('Select at most 100 points along the outline', 'FontName', '?L?n??????', 'FontSize', 14);
[ ctrlPointX, ctrlPointY ] = ginput(H_sample);
ctrlPointList = [ctrlPointX ctrlPointY];
clickedN = size(ctrlPointList,1);

promptStr = sprintf('%d points selected', clickedN);
xlabel (promptStr, 'FontName', '?L?n??????', 'FontSize', 14);

%% Calculate Bazier Curve (Your efforts here)
Quality = 1; % 0 => Low 1 => High
outlineVertexList = Bezier(ctrlPointList,Quality); %Enrich outlineVertexList
%% Draw and fill the polygon  Last 3 input arguments: (ctrlPointScattered, polygonPlotted, filled)

figure; result = drawAndFillPolygon( rbImage, ctrlPointList, outlineVertexList, true, true, true );
imwrite(result, 'Scale100High.png');
