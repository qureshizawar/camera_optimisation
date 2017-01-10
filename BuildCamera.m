function [ KMatrix , CameraHeight , CameraWidth ] = BuildCamera()

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