function [Grid] = BuildGrid(GridIncrement,GridWidth)
%BUILDGRID Function returns homogeneous Points (in 3-D) defining all
%corners in a square grid with square tiles. The grid has side length
%GridWidth and each tile has side length GridIncrement.

%Check the validity of the inputs

%Calculate number of tiles in one row of the grid. Make sure the result is
%an integer.
n = GridWidth/GridIncrement;

if isinteger(int8(n))== 0 
    error('GridWidth/GridIncrement is not an integer')
end 

%(n+1)^2 is how many Points are required to define the corners of each tile 
%in the grid. Define this number
n2 = (n+1)^2;

%Assign space for a 4xn2 matrix which will contain the Points of the grid
Grid = zeros(4,n2);

%Set the homogeneous multiplier of each Point on the grid to 1
Grid(4,:)= 1;

%Define a grid in the x-y plane centred on the origin by defining
%the x and y components of the grid

%The grid is defined by all permutations of the following two vectors
x = linspace(-GridWidth/2,GridWidth/2,n+1);
y = linspace(-GridWidth/2,GridWidth/2,n+1);
    

for j=1:n+1;
    %systematically fill in sections of length n+1 of Grid by 
    %first defining all points with y cooridinates y(1), then y(2), and so on
    Grid(1,(j-1)*(n+1)+1 : j*(n+1)) = x;
    Grid(2,(j-1)*(n+1)+1 : j*(n+1)) = y(j);
end
end