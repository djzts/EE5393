CKTFp=fopen('CKT.txt');
s=[1 2 3 4 5];

Al=[1 4 3 5 2];
Bl=[1 4 5 2 3];
Cl=[1 3 4 2 5];
Dl=[1 2 4 5 3];
El=[1 4 2 3 5];

A=CPM(Al);
B=CPM(Bl);
C=CPM(Cl);
D=CPM(Dl);
E=CPM(El);
I=eye(5);
 
 i=1;
 L=[];
 while ~feof(CKTFp)
    L(i).insc=fgetl(CKTFp);
    i=i+1;
 end
fclose(CKTFp);
n=length(L);
for k=1:n
l1=L(k).insc;
oP=1;
for i=1:length(l1)
    if(l1(i))=='{'
        oP=i+1;
        break;
    end
end
for i=oP:length(l1)
    if(l1(i))==':'
        valName='';
        for j=oP:i-1
            valName(j-oP+1)=l1(j);
        end
        L(k).valName=valName;
        oP=i+1;
        break;
    end
end
for i=oP:length(l1)
    if(l1(i))==','
        P1='';
        for j=oP:i-1
            P1(j-oP+1)=l1(j);
        end
        L(k).P1=P1;
        oP=i+1;
        break;
    end
end
for i=oP:length(l1)
    if(l1(i))=='}'
        P0='';
        for j=oP:i-1
            P0(j-oP+1)=l1(j);
        end
        L(k).P0=P0;
        oP=i+1;
        break;
    end
end
end

for i=1:n
    P1=L(i).P1;
    P1s='';
    P1sP=1;
    for j=1:length(P1)
        if P1(j)=='*'
            P1s='*I';
        end
        if P1(j)<='Z'&& P1(j)>='A'
           P1s(P1sP)='*';
           P1sP=P1sP+1;
           P1s(P1sP)=P1(j);
           P1sP=P1sP+1;
        end
        if P1(j)==''''
           P1s(P1sP)=P1(j);
           P1sP=P1sP+1;
        end
        
    end
    L(i).P1s=P1s;
end



for i=1:n
    P0=L(i).P0;
    P0sP=1;
    P0s='';
    for j=1:length(P0)
        if P0(j)=='*'
            P0s='*I';
        end
        if P0(j)<='Z'&& P0(j)>='A'
           P0s(P0sP)='*';
           P0sP=P0sP+1;
           P0s(P0sP)=P0(j);
           P0sP=P0sP+1;
        end
        if P0(j)==''''
           P0s(P0sP)=P0(j);
           P0sP=P0sP+1;
        end
        
    end
    L(i).P0s=P0s;

end

varList='';
for i=1:n
   newVar=1;
   thisVar=L(i).valName;
   for j=1:length(varList)
       if thisVar==varList(j)
           newVar=0;
           L(i).varIndex=j;
           break;           
       end
   end
   if newVar
       varList(length(varList)+1)=thisVar;
        L(i).varIndex=length(varList);
   end
end
varList
numVar=length(varList);
TT=zeros(numVar,2^numVar);
for i=1:numVar
    for j=1:2^numVar
    TT(i,j)=mod(bitshift(int64(j-1),-1*(i-1)),2);
    end
end
TTr=zeros(1,2^numVar);
for i=1:2^numVar
    cS=I;%currentState
    for j=1:n
        var=L(j).varIndex;
        if TT(var,i)
            nSS=strcat('cS',L(j).P1s);% next state string
        else
            nSS=strcat('cS',L(j).P0s);% next state string
        end
        cS=eval(nSS);
    end
    if cS==I
        TTr(i)=0;
    else
        TTr(i)=1;
    end
    
end


x=TT(1,:);
z=TT(2,:);
y=TT(3,:);
TT
and(not(and(x,z)),not(and(not(x),not(y))))
TTr