function [M] = binmatrix(n)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
M=zeros(n+1,n+1);
MSC=0;
thisRow=zeros(1,n+1);
for i=0:n
    MSC=nchoosek(n,n-i);%main stream coeffient
    mainstream=1;
    for j=1:i
        mainstream=conv(mainstream,[1 -1]);
    end
    mainstream=mainstream*MSC;

    thisRow=[zeros(1,n-i) mainstream];
     M(i+1,:)=thisRow;   
end

end

