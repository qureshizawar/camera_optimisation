function [KMatrix_adj, Rotation_adj, Translation_adj] = ...
        BuildAdjustedHomography(P)
    
    KMatrix_adj = [P(1) P(2) P(3);0 P(4) P(5);0 0 1];
    
    Rotation_adj = [ P(6); P(7); P(8)];
    
    Translation_adj = [P(9); P(10); P(11)];