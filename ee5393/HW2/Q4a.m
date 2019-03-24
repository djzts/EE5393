function [ conP ] = Q4a( n,m,p )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

M=zeros(n);
if m<n/2
con=zeros(n,m);
conPointer=ones(n,1);

for i=1:n
    doneMark=0;
    while ~doneMark
        thisPos=int64(n*rand+0.5);
        if thisPos==n+1;
            thisPos=n;
        end
        if thisPos~=i
            bool=1;
            for l=1:conPointer(i)-1
                if con(i,l)==thisPos
                    bool=0;
                    break;
                end
            end
            if bool
                con(i,conPointer(i))=thisPos;
                conPointer(i)=conPointer(i)+1;
            end
        end
        if conPointer(i)==m+1
            doneMark=1;        
        end
    end
end

for i=1:n
    for j=1:m
        if rand<p
            M(i,con(i,j))=1;
        end
    end
end

else
    
Ncon=zeros(n,n-m);
NconPointer=ones(n,1);

for i=1:n
    doneMark=0;
    while ~doneMark
        thisPos=int64(n*rand+0.5);
        if thisPos==n+1;
            thisPos=n;
        end
        if thisPos~=i
            bool=1;
            for l=1:NconPointer(i)-1
                if Ncon(i,l)==thisPos
                    bool=0;
                    break;
                end
            end
            if bool
                Ncon(i,NconPointer(i))=thisPos;
                NconPointer(i)=NconPointer(i)+1;
            end
        end
        if NconPointer(i)>=n-m+1
            doneMark=1;        
        end
    end
end
M=ones(n);
for i=1:n
    for j=1:n-m
       M(i,Ncon(i,j))=0;
    end
end
for i=1:n
    for j=1:n
        if rand>p
            M(i,j)=0;
        end
    end
end
    
    
end
M=M+eye(n);
Mnn=double(M^n&logMpowN(M,n))-eye(n);
conP=sum(sum(Mnn))/(n^2-n);
end

