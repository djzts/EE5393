function [A]=CPM(c)
    n=length(c);
    old=c;
    new=zeros(1,n);
    for i=1:n-1
        new(i)=c(i+1);
    end
    new(n)=c(1);
    [B,I]=sort(old);
    p=zeros(1,n);
    for i=1:n
        p(i)=new(I(i));
    end
    A=zeros(n);
    for i=1:n
        A(i,p(i))=1;
    end
end