%q3 - Rotation

figure; %Launch figure window

x = 0; y = 0; z = 0; % Specify origin points x,y,z
u = 2; v = -1; w = 1; % Specify direction points u,v,w

quiver3(x,y,z,u,v,w); % Show 3D arrows in figure
xlim([-2,2]); ylim([-2,2]); zlim([-2,2]);
hold all;  %This keeps all previous plots in the current figure when adding 
           %new data. It also uses different colors each time we add data 
           %to the figure.

% Rotation matrices

theta = 45; % Degrees
theta = theta / 180 * pi; %Convert to radians

Rz = [cos(theta),sin(theta),0   ;... %Row 1
      -sin(theta),cos(theta),0   ;... %Row 2
      0         ,0         ,1   ];   %Row 3

%% Write your code in this block

% u, v, w vector
vec = [ u; v; w ];

% Projection matrix for X axis
P = [ 1, 0, 0 ;... % Row 1
      0, 0, 0 ;... % Row 2
      0, 0, 0 ];   % Row 3

% Project our vector on X axis
vec_x_projection = P*vec;

% Rotate unit vector on X direction 45 degrees around Z axis
unit_x = [ 1, 0, 0 ]';
b1 = Rz * unit_x;
b1 = b1 / sqrt(b1(1)^2 + b1(2)^2);
quiver3(x, y, z, b1(1), b1(2), b1(3));

% Rotote unit vector -45 degrees around Z axis
b2 = Rz' * unit_x;
b2 = b2 / sqrt(b2(1)^2 + b2(2)^2);
quiver3(x, y, z, b2(1), b2(2), b2(3));

% Calcualte dot-prodoct of b1 and b2
b1_cdot_b2 = dot(b1', b2');

% Find the closest projection of our uvw vector on span{b1,b2}
vec_projection = vec' * [ b1, b2 ]