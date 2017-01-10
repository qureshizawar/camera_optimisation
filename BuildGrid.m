function [Grid] = BuildGrid(GridIncrement,GridWidth)

n = GridWidth/GridIncrement;
x = linspace(0,GridWidth,n);
y = linspace(0,GridWidth,n);
A=zeros(1,n);
B=zeros(1,n);
B(:)=1;

Grid = [x; y; A; B;];