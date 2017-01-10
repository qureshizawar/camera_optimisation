function [Correspond] = BuildNoisyCorrespondences (T_ow ,T_cw , CalibrationGrid , ...
KMatrix , CameraHeight , CameraWidth )

% Compute the positions of the GridCorners in the world
CalibrationGrid = T_ow * CalibrationGrid


CameraGrid = ( T_cw \ CalibrationGrid )

Correspond = CameraGrid

plot(CameraGrid(1,1),CameraGrid(2,1))

    % Compute where corners are in the unit camera frame
    %%UnitCorners = ( T_cw \ GridCorners )
    
    %Correspond = [[GridCorners(1,1:4),GridCorners(2,1:4)]']