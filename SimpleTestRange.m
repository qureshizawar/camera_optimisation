function [] = SimpleTestRange ( Parameter , MinVal , MaxVal )
% SimpleTestRange
% Tests the range of Parameter agains MinVal and MaxVal .
% If the test fails an error message results quoting the Parameter
% as an identifier and Matlab exits .

if Parameter < MinVal || Parameter > MaxVal
error ('An input parameter , %d, was out of range ', Parameter )
end


 end