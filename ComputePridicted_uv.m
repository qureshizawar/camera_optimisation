function [Pridicted_uv] = ComputePridicted_uv ( KMatrix ,NANGLE, NTRANSLATION,...
    NCORRESPOND, NCONSENSUS)

T = zeros(3);
T(:,1) = 1;
T(:,2) = NANGLE;
T(:,3) = NTRANSLATION;

s = sum( all( NCONSENSUS ~= 0, 1 ) );

Actual = zeros(4,s);
 
for i = 1:s
    Actual(:,i) = NCORRESPOND(:,NCONSENSUS(i));
end

H = KMatrix*T;

Actual_xy = zeros(3,s);
Actual_xy(3,:) = 1;
Actual_xy(1:2,:) = Actual(3:4,:);

Pridicted_uv = H*Actual_xy;

NormPridicted_uv = zeros(3,s);

for j = 1:s
    NormPridicted_uv(:,j) = Pridicted_uv(:,j)/Pridicted_uv(3,j);
end

Pridicted_uv = NormPridicted_uv;
