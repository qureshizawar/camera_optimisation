% A straight script called Camera SimpleScriptCameraModel .
% An example of a simple script with no function calls .
%
% This script expects the following parameters to exist in the Matlab
% environment ( their names should appear in response to a 'who ' command ).
%
% ChipWidth - An integer describing the number of horizontal pixels .
% ChipHeight -An integer describing the number of vertical pixels .
% FocalLength - The camera focal length ( between 1.0 and 100.0 mm)
% PixelWidth - The pixel width ( between 0.001 and 0.1 mm)
% PixelHeight - The pixel height ( between 0.001 and 0.1 mm)
% Skewness - The skewness in u- pixels ( between -0.1 and 0.1)
% P_u - The offset to the principal point as a fraction of the width
% P_v - The offset to the principal point as a fraction of the height
%
% The resulting K- Matrix is called KMatrix .

ChipWidth = [200];
ChipHeight = [300];
FocalLength = [1.0];
PixelWidth = [0.0001];
PixelHeight = [0.0001];
Skewness = [-0.1];
P_u = [0.25];
P_v = [0.25];

% Test in the inputs satisify the design constraints
Frac = ChipWidth - fix( ChipWidth );
if Frac ~= 0
error (' ChipWidth is not integer ')
end

if ChipWidth < 200 || ChipWidth > 4000
BUILDING A CAMERA MODEL IN MATLAB
error (' ChipWidth is out of range ')
end

Frac = ChipHeight - fix( ChipHeight );
if Frac ~= 0
error (' ChipHeight is not integer ')
end

if ChipHeight < 300 || ChipHeight > 5000
error (' ChipHeight is out of range ')
end

if FocalLength < 1 || FocalLength > 100.0
error (' FocalLenght is out of range ')
end

% Carry out the rest of the bounds checking ..... I think you get the idea

% Construct the model

% The focal length in u- pixels
FuPixels = FocalLength / PixelWidth ;

% The focal length in v- pixels
FvPixels = FocalLength / PixelHeight ;


% Construct the K- Matrix
KMatrix = ...
[ FuPixels Skewness P_u* ChipWidth ;...
 0 FvPixels P_v * ChipHeight ;...
 0 0 1]