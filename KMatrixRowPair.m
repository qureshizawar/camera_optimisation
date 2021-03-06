function [A] = KMatrixRowPair(Homog)

h11 = Homog(1,1);
h12 = Homog(1,2);
h13 = Homog(1,3);
h21 = Homog(2,1);
h22 = Homog(2,2);
h23 = Homog(2,3);
h31 = Homog(3,1);
h32 = Homog(3,2);

A11 = h11^2 - h12^2;
A12 = 2*(h11*h21 - h12*h22);
A13 = 2*(h11*h31 - h12*h32);
A14 = h21^2 - h22^2;
A15 = 2*(h21*h31 - h22*h32);
A16 = h31^2 - h32^2;
A21 = h11*h12;
A22 = h11*h22 + h21*h12;
A23 = h11*h32 + h31*h12;
A24 = h21*h22;
A25 = h21*h32 + h31*h22;
A26 = h31*h32;

A = [A11 A12 A13 A14 A15 A16; A21 A22 A23 A24 A25 A26];

