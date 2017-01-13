function [ T_cw ] = PositionCamera_old ( T_ow )
% PositionCamera
% Generates a 'random ' camera frame that has a good chance of the
% object being visible in the camera when the object is a 1m cube .
%
% Input T_ow is the 4x4 object frame in world coordinates
% T_cw is the 4x4 camera frame in world coordinates .

% Assign space for the camera frame
T_cw = zeros (4);

% Set the homogeneous multiplier to 1
T_cw (4 ,4) = 1;

% extract the object origin
ObjectOrigin = T_ow (1:3 ,4) ;

% View the camera from about 10 metres or so ( unrelated to the object
% frame ).
InitialViewVector = 10000* rand (3 ,1);

% Define the origin of the camera frame in world coordinates
T_cw (1:3 ,4) = ObjectOrigin - InitialViewVector ;

% Define the camera z- axis as pointing at the object origin
Normz = norm ( InitialViewVector );
if Normz < eps
error (' Unable to normalize the camera z-axis ');
end
% Define a unit vector
InitialCameraz = InitialViewVector / Normz ;

% Perturb the initial z axis a bit
CameraZ = InitialCameraz - 0.01* rand (3 ,1);

% ... and normalize again (no need to check norm )
CameraZ = CameraZ / norm ( CameraZ );

% Define a random camera x- axis
CameraX = rand (3 ,1);
% project out the z- axis
CameraX = CameraX - ( CameraZ'* CameraX )* CameraZ ;
% normalize the x- axis
Normx = norm ( CameraX );
if Normx < eps
error (' Unable to normalize the camera x-axis ')
end
CameraX = CameraX / Normx ;

% Define the y- axis
CameraY = cross ( CameraZ , CameraX );

% Complete the transformation matrix
T_cw (1:3 ,1:3) = [ CameraX CameraY CameraZ ];

end