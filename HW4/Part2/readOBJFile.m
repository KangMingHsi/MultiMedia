clear all
close all
%% show the obj file at 3D figure
al = fopen('al7KC.obj');

vertex_al = fscanf(al,'v %f %f %f %f %f %f\n',[6, Inf])';
faces_al = fscanf(al,'f %f %f %f\n',[3, Inf])';

fclose(al);

vertex = vertex_al(:,1:3);
faces = faces_al;
vertColors = vertex_al(:,4:6);

offset = length(vertex);

X_max = max(vertex(:,1));
Y_max = max(vertex(:,2));
Z_max = max(vertex(:,3));

X_min = min(vertex(:,1));
Y_min = min(vertex(:,2));
Z_min = min(vertex(:,3));

trans = [(X_max+X_min)/2, (Y_max+Y_min)/2, (Z_max+Z_min)/2];

verts = [vertex(:,1) - trans(1), vertex(:,2) - trans(2), vertex(:,3) - trans(3)];

% trisurf(faces,vertex(:,1) - trans(1),vertex(:,2) - trans(2),vertex(:,3) - trans(3),'FaceVertexCData', vertColors,'FaceColor','interp', 'EdgeAlpha', 0,...
%     'AmbientStrength', 1, 'DiffuseStrength', 1, 'SpecularStrength', 1);
%% Adding the HSV color cylinder onto the same world space as al7KC.obj, and then do some transformation
% (Hint) You can try to combine 2 objects' vertices, faces together
%% For cylinder
numOfVert = 60;
angle = linspace(0, 2*pi, numOfVert+1);
vertX = cos(angle);
vertY = sin(angle);

%% Define Vertices
topVerts = [0 0 1];
topVertIndex = [offset+1];
botVerts = [0 0 0];
botVertIndex = [offset+63];

vertColors = [vertColors; hsv2rgb([0, 0, 1])];

for i = 1:length(angle)
   topVert = [vertX(i) vertY(i) 1];
   topVerts = [topVerts; topVert];
   topVertIndex = [topVertIndex offset+i+1];
   vertColors = [vertColors; hsv2rgb([angle(i) / 2 / pi, 1, 1])];
end

vertColors = [vertColors; hsv2rgb([0 1 0])];

for i = 1:length(angle)
   botVert = [vertX(i) vertY(i) 0];
   botVerts = [botVerts; botVert];
   botVertIndex = [botVertIndex offset+63+i];
   vertColors = [vertColors; hsv2rgb([angle(i) / 2 / pi, 1, 0])];
end

cylinder_verts = [ topVerts; botVerts ];
verts = [verts; cylinder_verts(:,1),cylinder_verts(:,2) + 2.5,cylinder_verts(:,3) - 3];

%% Top faces

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
trisurf(faces,verts(:,1),verts(:,2),verts(:,3),'FaceVertexCData', vertColors,'FaceColor','interp', 'EdgeAlpha', 0,...
    'AmbientStrength', 0.1, 'DiffuseStrength', 0.8, 'SpecularStrength', 1);
%% Lighting (You may need to modify the lighting here)
%l1 = light('Position',[0.0,0.0,100.0], 'Style', 'local', 'Visible', 'on');
l2 = light('Position',[0.0,0.0,100.0], 'Style', 'infinite', 'Visible', 'on');
lighting phong;

kl1 = [1, 0, 0];
kl2 = [0.1, 1, 0];
kl3 = [0.1, 0.1, 1];
kl4 = [0.1, 0.8, 1];