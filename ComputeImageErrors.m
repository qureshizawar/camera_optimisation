function [E] = ComputeImageErrors ( KMatrix , ...
    NANGLE, NTRANSLATION,...
    NCORRESPOND, NCONSENSUS)

s = sum( all( NCONSENSUS ~= 0, 1 ) );

Actual = zeros(4,s);

for i = 1:s
    Actual(:,i) = NCORRESPOND(:,NCONSENSUS(i));
end

Actual_uv = zeros(3,s);
Actual_uv(3,:) = 1;
Actual_uv(1:2,:) = Actual(1:2,:);

Pridicted_uv = ComputePridicted_uv ( KMatrix ,NANGLE, NTRANSLATION,...
    NCORRESPOND, NCONSENSUS);

Error = zeros(2,1);
for k = 1:s
    %Error = Error + (Pridicted_uv(:,k) - Actual_uv(:,k));
    Error(1:2,k) = ((Pridicted_uv(1:2,k)) - Actual_uv(1:2,k));
end

%E = Error;

e = zeros(2*s,1);
for z = 1:s
    e(((2*z)-1),1) = Error(1,z);
    e((2*z),1) = Error(2,z);
end

%u
%e(1:s) = Error(1,:);
%v
%e(s+1:2*s) = Error(2,:);

E = e;