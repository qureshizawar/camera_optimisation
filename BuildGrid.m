function [Grid] = BuildGrid(GridIncrement,GridWidth)
%BUILDGRID Function returns homogeneous Points (in 3-D) defining all
%corners in a square grid with with square tiles. The grid has side length
%GridWidth and each tile has side length GridIncrement.

n = GridWidth/GridIncrement;

%Check the validity of the inputs

%Calculate how many tiles in one row of the grid. Make sure the result is
%an integer.

if isinteger(int8(n))== 0 
    error('GridWidth/GridIncrement is not an integer')
end 

%(N+1)^2 is how many Points are required to define the corners of each tile 
%in the grid. Define this number

n2 = (n+1)^2;
Grid = zeros(4,n2);
x = linspace(-GridWidth/2,GridWidth/2,n+1);
%x = -500:10:500;
y = linspace(-GridWidth/2,GridWidth/2,n+1);
%y = -500:10:500;
    
Grid(3,:)= 0;
Grid(4,:)= 1;

for j=1:n+1;
    %Here we systematically fill in sections of length N+1 of GridPoints by 
    %first defining all points with x cooridinates x(1), then x(2), and so on
    Grid(1,(j-1)*(n+1)+1 : j*(n+1)) = x;
    Grid(2,(j-1)*(n+1)+1 : j*(n+1)) = y(j);
end
end