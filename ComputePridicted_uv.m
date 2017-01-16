function [Pridicted_uv] = ComputePridicted_uv ( KMatrix ,NANGLE, NTRANSLATION,...
    NCORRESPOND, NCONSENSUS)

%Build rotation matrix using Rodrigues rotation formula
%Norm of Angle-Axis representation is the rotation angle
RotationAngle = norm(NANGLE);
RotationAxis = NANGLE/RotationAngle;
R = RodriguesRotation ( RotationAxis , RotationAngle );

%Build Transformation matrix using first 2 columns of rotation matrix
%and the translation vector
T = zeros(3);
T(:,1) = R(:,1);
T(:,2) = R(:,2);
T(:,3) = NTRANSLATION;

%Find the number of points in the consensus set (returns number of
%non-zero elements)
s = nnz(NCONSENSUS);

%Build matrix to store %Extract the actual image(u,v) and object(x,y) 
%points
Actual = zeros(4,s);

%Extract the actual image(u,v) and object(x,y) points
for i = 1:s
    Actual(:,i) = NCORRESPOND(:,NCONSENSUS(i));
end

%Build the actual image points(u,v) matrix
Actual_xy = zeros(3,s);
Actual_xy(3,:) = 1;
Actual_xy(1:2,:) = Actual(3:4,:);

%Compute Pridicted image points(u,v)
Pridicted_uv = KMatrix*T*Actual_xy;

%Normalise Pridicted image points(u,v)
NormPridicted_uv = zeros(3,s);

for j = 1:s
    NormPridicted_uv(:,j) = Pridicted_uv(:,j)/Pridicted_uv(3,j);
end

Pridicted_uv = NormPridicted_uv;
