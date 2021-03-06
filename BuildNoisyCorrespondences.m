function [Correspond] = BuildNoisyCorrespondences (T_ow ,T_cw , CalibrationGrid , ...
KMatrix , CameraHeight , CameraWidth, NoiseSD)

%BUILDNOISYCORRESPONDENCES Function builds a matrix containing all points
%in a grid within the camera's view (in the grid's coordinate frame, [x,y])
%along with the correponding points on the camera's sensor chip (in [u,v]
%steps). The [u,v] points have noise added to them.

%The points on the grid ([x,y]) are defined by CalibrationGrid.
%The object and camera's positions/orientations are defined by 
%transformation matrices T_ow and T_cw. 
%NoiseSD is the standard deviation of the noise added to the [u,v] points

%First generate the exact points [u,v] by transforming Points in CalibrationGrid to the
%camera's sensor chip in CameraGrid_uv

%Ensure GridPoints has the correct dimensions
if size(CalibrationGrid, 1) ~= 4;
    error('CalibrationGrid has incorrect dimensions')
end

%END OF INPUT CHECKS

% Compute the positions of the GridCorners in the world
WorldGrid = T_ow * CalibrationGrid;

%Transform the grid points to camera coordinates (in the camera's unit plane) 
%Note T_wc = (T_cw)^(-1)
CameraGrid = ( T_cw \ WorldGrid );

%Extract the 3-D points from GridPoints by removing the homogeneous scaler
%from the matrix
CameraGrid_3D = CameraGrid(1:3, :);

%Transform these points into 2-D homogeneous Points by multiplying by the
%camera's KMatrix
CameraGrid_2D_Hom = KMatrix*CameraGrid_3D;

%Scale each 2-D homogeneous Point by its homogeneous scaler to recover 2-D
%coordinates in [u,v]
s = size(CameraGrid_2D_Hom, 2);

%Assign space for the 2-D coordinate matrix in [u,v] steps
CameraGrid_uv = zeros(2, s);

% We now have a set of homogeneous Points representing 2D points .
% We need to normalise these Points to get 2D points .
for i=1:s
    CameraGrid_uv(:,i) = CameraGrid_2D_Hom(1:2, i)/CameraGrid_2D_Hom(3, i);
end

%Find out which of the grid points lie within the camera's view, making
%a note of where they lie in CameraGrid_uv, and place these points within
%another matrix.

%Assign space for the matrix of points inside the camera. Assign space
%sufficient to store all points in CameraGrid_uv
InsidePoints_uv = zeros(2, s);

%Assign space for an array containing the index of all points within
%the camera's view (their column within CameraGrid_uv)
InsideIndex = zeros(1, s);

%Define an index to place coordinates in InsidePoints_uv
k = 1;

for i=1:s
    if CameraGrid_uv(1, i) > 0 && CameraGrid_uv(1, i) < (CameraWidth -1) ... 
       && CameraGrid_uv(2, i) > 0 && CameraGrid_uv(2, i) < (CameraHeight -1)
       %If the [u,v] point is within the camera's view, place the 
       %point in InsidePoints_uv and store its column index within InsideIndex
       InsidePoints_uv(:, k) = CameraGrid_uv(:, i);
       InsideIndex(k) = i;
       %Increment k 
       k = k + 1;
    end
end

%Decrement k to account for one unnecessary increment at the end of the
%above 'for' loop
k=k-1;

%Add noisy vectors to the [u,v] grid points using the function 'randn'
%NoiseSD = sqrt(0.5);
Noise = NoiseSD*randn(2, s);

InsidePoints_uv = InsidePoints_uv + Noise;

%Extract the [x,y] coordinates, corresponding to the [u,v] coordinates
%identified earlier, from CalibrationGrid

%Assign space for the corresponding points
InsidePoints_xy = zeros(2,s);

for i = 1:k
    %Extract the index from InsideIndex
    j = InsideIndex(i);
    InsidePoints_xy(:, i) = CalibrationGrid(1:2, j); 
end

%Build the matrix of corresponding [x,y] and [u,v] points

%Assign space for Correspond
Correspond = zeros(4, s);

Correspond(1:2,:) = InsidePoints_uv;
Correspond(3:4,:) = InsidePoints_xy;

%Cut Correspond down to size 'k' to remove unnecessary spaces
Correspond = Correspond(:, 1:k);
end