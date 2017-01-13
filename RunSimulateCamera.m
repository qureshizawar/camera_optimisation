% Simulates viewing a 3D object (a cube ) to demonstrate the
% structures built up to calibrate a camera .


% Construct a Camera
%[ KMatrix , CameraHeight , CameraWidth ] = BuildCamera ;
ChipWidth =  [200];
CameraWidth =  [200];
ChipHeight =  [300];
CameraHeight =  [300];
FocalLength = [1.0];
PixelWidth = [0.0001];
PixelHeight = [0.0001];
Skewness = [-0.1];
P_u = [0.25];
P_v = [0.25];

Parameters = [ ChipWidth , ChipHeight , ...
    FocalLength , PixelWidth , PixelHeight ,...
    Skewness ,P_u , P_v];

KMatrix = SingleVectorCameraModel ( Parameters );

% Construct an object in its own frame
%Cube = BuildCube ;
ObjectLines = [
 0 0 1 1 0 0 1 1
 0 1 1 0 0 1 1 0
 0 0 0 0 1 1 1 1
 0 0 0 0 0 0 0 1];

% Position the object in space
T_ow = PositionObject ;

% Position the camera so that it is likely that the object can be seen
T_cw = PositionCamera_old ( T_ow );

% Look at what we have
ViewCamera (ObjectLines ,T_ow , KMatrix , CameraHeight , CameraWidth , T_cw )