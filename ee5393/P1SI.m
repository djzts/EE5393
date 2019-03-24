function [f] = P1SI(X)
    CKT=[0.0000
    0.2000
    0.2000
    0.2333
    0.2667
    0.3333];
    
    n=length(CKT);
    s=length(X);
    f=zeros(1,s);
    for j=1:s
        for i=1:n
            f(j)=f(j)+CKT(n+1-i)*nchoosek(n-1,i-1)*X(j).^(i-1)*(1-X(j)).^(n-i);
        end
    end
end

