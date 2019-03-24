endMark=1;
max2now=0;
while(endMark)
n=6;
A=zeros(n);
xbar=1;
x=2;
ybar=3;
y=4;

occupy=zeros(2,8);
gen=0;

while gen<8
    thisRand=int16(rand(2,1)*n+0.5);
    if thisRand(1)<thisRand(2)
        repeatMark=0;
        for i=1:gen
            if(~any(thisRand~= occupy(:,i)))
                repeatMark=1;
            end
        end
        if ~repeatMark
            gen=gen+1;
            occupy(:,gen)=thisRand;
        end
    end
end


for i=1:8
    A(occupy(1),occupy(2))=mod(i,4);
end



for i=1:n
    for j=1:n
        if A(i,j)~=0
            A(j,i)=A(i,j);
        end
    end
end

C=[1 0 1 0  %xbar,ybar
   1 0 0 1  %xbar,y
   0 1 1 0  %x,ybar
   0 1 0 1]; %x,y

A1=zeros(n);
A2=zeros(n);
A3=zeros(n);
A4=zeros(n);
A11=zeros(n);
A21=zeros(n);
A31=zeros(n);
A41=zeros(n);

Ctemp=0;    
for i=1:n
    for j=1:n
        Ctemp=A(i,j);
        if Ctemp~=0
            A11(i,j)=C(1,Ctemp);
            A21(i,j)=C(2,Ctemp);
            A31(i,j)=C(3,Ctemp);
            A41(i,j)=C(4,Ctemp);
        end
    end
end

A11=A11+eye(n);
A21=A21+eye(n);
A31=A31+eye(n);
A41=A41+eye(n);

A1=A11^n;
A2=A21^n;
A3=A31^n;
A4=A41^n;

y=[0 1 0 1]';
x=[0 0 1 1]';
TT=zeros(4,16);
TT(:,1)=zeros(4,1);
TT(:,2)=x;
TT(:,3)=not(x);
TT(:,4)=y;
TT(:,5)=not(y);
TT(:,6)=and(x,y);
TT(:,7)=and(x,not(y));
TT(:,8)=and(not(x),y);
TT(:,9)=and(not(x),not(y));
TT(:,10)=or(x,y);
TT(:,11)=or(x,not(y));
TT(:,12)=or(not(x),y);
TT(:,13)=or(not(x),not(y));
TT(:,14)=xor(x,y);
TT(:,15)=not(xor(x,y));
TT(:,16)=ones(4,1);


for i=1:n
    for j=1:n;
        if A1(i,j)~=0
            A1(i,j)=1;
        end
        if A2(i,j)~=0
            A2(i,j)=1;
        end
        
        if A3(i,j)~=0
            A3(i,j)=1;
        end
        if A4(i,j)~=0
            A4(i,j)=1;
        end
    end 
end


fucntionNum=zeros(3,nchoosek(n,2));
l=length(fucntionNum);
k=0;
for i=1:n
    for j=i:n
        if(i~=j)
            k=k+1;
            thisTT=[A1(i,j) A2(i,j) A3(i,j) A4(i,j)]';
            fucntionNum(2,k)=i;
            fucntionNum(3,k)=j;
                    
            for m=1:16
                if(~any(thisTT~=TT(:,m)))
                    fucntionNum(1,k)=m;
                    break; 
                end
            end
        end
    end
end

impFunc=zeros(1,16);

for i=1:l
    impFunc(fucntionNum(1,i))=1;
end
impFunc(16)=1;
thisIm=sum(impFunc);
if(thisIm==16)
    endMark=0;
else
    if thisIm>=max2now
        max2now=thisIm; 
        max2now
        if max2now>13
            occupy
        end
    end
        
end

end