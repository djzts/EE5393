function [S] = fireRi(F,C,S)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
for i=1:length(S)
    S(i)=S(i)-F(i)+C(i);
end
if min(S)<0
    fprintf('negative state error\n');
    F
    C
    S
end
    
end

