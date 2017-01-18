function [] = TestRange ( Parameter , MinVal , MaxVal , Name )
% TestRange
% Tests the range of Parameter against MinVal and MaxVal .
% If the test fails an error message results quoting the Parameter
% as an identifier, explaining if it is too high/low and Matlab exits .

if Parameter < MinVal
    error (' Input parameter %s, value %d, was too low ', ...
    Name , Parameter )

elseif Parameter > MaxVal
    error (' Input parameter %s, value %d, was too high ', ...
    Name , Parameter )
end


end