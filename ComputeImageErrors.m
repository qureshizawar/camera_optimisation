function [E] = ComputeImageErrors ( KMatrix , ...
    NANGLE, NTRANSLATION,...
    NCORRESPOND, NCONSENSUS)

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
Actual_uv = zeros(3,s);
Actual_uv(3,:) = 1;
Actual_uv(1:2,:) = Actual(1:2,:);

%Compute Pridicted image points(u,v) matrix
Pridicted_uv = ComputePridicted_uv ( KMatrix ,NANGLE, NTRANSLATION,...
    NCORRESPOND, NCONSENSUS);

%Build error vector
Error = zeros(2*s,1);

%Compute error vector
for k = 1:s
    %Subtract the actual image points (extracted from the correspondence
    %matrix) from teh predicted image points
    Error(((2*k)-1):(2*k),1) = ((Pridicted_uv(1:2,k)) - Actual_uv(1:2,k));
end

E = Error;