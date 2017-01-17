function [ KMatrix , CameraHeight , CameraWidth ] = BuildCamera()

ChipWidth =  [2100];
CameraWidth =  [2650];
ChipHeight =  [2650];
CameraHeight =  [2650];
FocalLength = [50.5];
PixelWidth = [0.05005];
PixelHeight = [0.05005];
Skewness = [0];
P_u = [0.5];
P_v = [0.5];

Parameters = [ ChipWidth , ChipHeight , ...
    FocalLength , PixelWidth , PixelHeight ,...
    Skewness ,P_u , P_v];

KMatrix = SingleVectorCameraModel ( Parameters );