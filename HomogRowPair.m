function [A,B] = HomogRowPair(Correspond)

u = Correspond(1);
v = Correspond(2);
x = Correspond(3);
y = Correspond(4);

A = [x y 1 0 0 0 -u*x -u*y
     0 0 0 x y 1 -v*x -v*y];
B = [u ; v];