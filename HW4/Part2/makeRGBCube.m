clear all; close all; clc;

%% Define Vertices
topVerts = [ 0 1 0; 0 1 1; 1 1 1; 1 1 0];
topVertIndex = [ 1 2 3 4 ];
botVerts = [ 0 0 0; 0 0 1; 1 0 1; 1 0 0];
botVertIndex = [ 5 6 7 8 ];

verts = [ topVerts; botVerts ];

%% Define Colors
vertColors = [ topVerts; botVerts ];
%% Empty faces list
faces = [];

%% Top faces
faces = [ faces ; 1 2 3 ; 1 3 4 ];

%% Side faces (Your efforts here)
for vertI = 1 : 4
	faceVert1 = topVertIndex( mod(vertI,4)+1 );
	faceVert2 = topVertIndex( vertI );
	faceVert3 = botVertIndex( vertI );
    faceVert4 = topVertIndex( mod(vertI,4)+1 );
	faceVert5 = botVertIndex( mod(vertI,4)+1 );
	faceVert6 = botVertIndex( vertI );
	faces = [ faces ; faceVert1 faceVert2 faceVert3; faceVert4 faceVert5 faceVert6];
end

%% Bottom faces
faces = [ faces ; 5 7 6 ; 5 8 7 ];

%% Show RGB Cube in 3D figure
trisurf(faces,verts(:,1),verts(:,2),verts(:,3),'FaceVertexCData', vertColors,'FaceColor','interp', 'EdgeAlpha', 0);

%% For cylinder
numOfVert = 60;
angle = linspace(0, 2*pi, numOfVert+1);
vertX = cos(angle);
vertY = sin(angle);

%% Define Vertices
topVerts = [0 0 1];
topVertIndex = [1];
botVerts = [0 0 0];
botVertIndex = [63];

vertColors = [hsv2rgb([0, 0, 1])];

for i = 1:length(angle)
   topVert = [vertX(i) vertY(i) 1];
   topVerts = [topVerts; topVert];
   topVertIndex = [topVertIndex i+1];
   vertColors = [vertColors; hsv2rgb([angle(i) / 2 / pi, 1, 1])];
end

vertColors = [vertColors; hsv2rgb([0 1 0])];

for i = 1:length(angle)
   botVert = [vertX(i) vertY(i) 0];
   botVerts = [botVerts; botVert];
   botVertIndex = [botVertIndex 63+i];
   vertColors = [vertColors; hsv2rgb([angle(i) / 2 / pi, 1, 0])];
end

verts = [ topVerts; botVerts ];
%% Top faces

faces = [];
for i = 1:length(angle)
    last = i+2;
    if last > 62
        last = 2;
    end
    faces = [ faces ; topVertIndex(1) topVertIndex(i+1) topVertIndex(last)];
end

%% Side faces
for vertI = 1:length(angle)
    tmp = vertI+2;
    if tmp > 62
        tmp = 2;
    end

    faceVert1 = topVertIndex( vertI+1 );
	faceVert2 = topVertIndex( tmp );
	faceVert3 = botVertIndex( vertI+1 );
    faceVert4 = topVertIndex( tmp );
	faceVert5 = botVertIndex( tmp );
	faceVert6 = botVertIndex( vertI+1 );
	faces = [ faces ; faceVert1 faceVert2 faceVert3; faceVert4 faceVert5 faceVert6];
end

%% Bottom faces
for i = 1:length(angle)
    last = i+2;
    if last > 62
        last = 2;
    end
    faces = [ faces ; botVertIndex(1) botVertIndex(i+1) botVertIndex(last)];
end

%% Show in 3D figure
figure;
trisurf(faces,verts(:,1),verts(:,2),verts(:,3),'FaceVertexCData', vertColors,'FaceColor','interp', 'EdgeAlpha', 0);