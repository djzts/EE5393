function [M] = convmatrix(n)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
M=zeros(n+1,n+1);
thisRow=zeros(1,n+1);
for i=0:n
    mainstream=1;
    for j=1:i
        mainstream=conv(mainstream,[1 -1]);
    end
    
    thisRow=[zeros(1,n-i) mainstream];
     M(i+1,:)=thisRow;   
end

end

