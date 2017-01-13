function [Grid] = BuildGrid(GridIncrement,GridWidth)

n = GridWidth/GridIncrement;
x = linspace(-GridWidth/2,GridWidth/2,n);
y = linspace(-GridWidth/2,GridWidth/2,n);
A=zeros(1,n);
B=zeros(1,n);
B(:)=1;

Grid = [x; y; A; B;]