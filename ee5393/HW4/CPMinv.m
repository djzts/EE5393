function [c]=CPMinv(A)
    n=length(A);
    s=linspace(1,n,n);
    old=s;
    new=A*s';
    c=zeros(1,n);
    c(1)=old(1);
    for i=2:n
        c(i)=new(c(i-1));
    end
end