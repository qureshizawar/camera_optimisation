function [ KMatrix ] = LongListCameraModel ( ChipWidth , ChipHeight , ...
    FocalLength , PixelWidth , PixelHeight ,...
    Skewness ,P_u , P_v)

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
% The function returns the K- Matrix

% Test in the inputs satisify the design constraints
Frac = ChipWidth - fix( ChipWidth );
if Frac ~= 0
    error (' ChipWidth is not integer ')
end

Frac = ChipHeight - fix( ChipHeight );
if Frac ~= 0
    error (' ChiHeight is not integer ')
end

%Test the ranges
SimpleTestRange ( ChipWidth ,200 ,4000) ;
SimpleTestRange ( ChipHeight ,300 ,5000) ;
SimpleTestRange ( FocalLength ,1.0 ,100.0) ;
SimpleTestRange ( PixelWidth ,0.0001 ,0.1) ;
SimpleTestRange ( PixelHeight ,0.0001 ,0.1) ;
SimpleTestRange ( Skewness , -0.1 ,0.1) ;
SimpleTestRange (P_u ,0.25 ,0.75) ;
SimpleTestRange (P_v ,0.25 ,0.75) ;

% The focal length in u- pixels
FuPixels = FocalLength / PixelWidth ;

% The focal length in v- pixels
FvPixels = FocalLength / PixelHeight ;


% Construct the K- Matrix for return
KMatrix = ...
[ FuPixels Skewness P_u* ChipWidth ;...
0 FvPixels P_v * ChipHeight ;...
0 0 1];
end