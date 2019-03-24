function [M]=logMpowN(M,n)
i=1;
l=length(M);
while i<n
M=double((M^2)&ones(l));
i=i*2;
end

end
