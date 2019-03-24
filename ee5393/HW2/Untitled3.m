n=128;
m=70;
p=0.5;

M=zeros(n);
con=zeros(n,m);
conPointer=ones(n,1);

for i=1:n
    doneMark=0;
    while ~doneMark
        thisPos=int16(50*rand+0.5);
        
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

M=M+eye(n);
Mnn=M^n&ones(n);
anyany=~any(any(~Mnn));

