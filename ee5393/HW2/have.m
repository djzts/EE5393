function [ bool ] = have(array,element)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
bool=0;
for i=1:length(array)
    if array(i)==element
        bool=1;
        break;
    end
end

