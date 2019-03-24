function [FoC]=reaction(l,varargin)

if mod(nargin,2)
FoC=zeros(1,l);
 
for i=2:2:nargin
   FoC(varargin{i})=varargin{i-1};

end

else
    FoC=[];
end
end

