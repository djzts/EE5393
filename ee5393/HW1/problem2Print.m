function [] = problem2Print()
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
x=[0 0 0 0 1 1 1 1];
y=[0 0 1 1 0 0 1 1];
z=[0 1 0 1 0 1 0 1];

g=zeros(5,8);
g(1,:)=and(x,y);
g(2,:)=xor(x,y);
g(3,:)=and(z,g(2,:));
g(4,:)=or(g(1,:),g(3,:));
g(5,:)=not(xor(z,g(2,:)));


gs1='and(x,y)';
gs2='xor(x,y)';
gs3='and(z,g(2,:))';
gs4='or(g(1,:),g(3,:))';
gs5='xor(z,g(2,:))';


c_std=or(and(x,y),and(z,xor(x,y)));
s_std=xor(z,xor(x,y));

c=zeros(32,8);
s=zeros(32,8);
numFaultGates=zeros(1,32);
for i=0:31
    rem=i;
    thisCase=zeros(1,5);
    for j=1:5
        thisCase(6-j)=mod(rem,2);
        rem=(rem-thisCase(6-j))/2;
    end
    numFaultGates(i+1)=sum(thisCase);
    for j=1:5
        thisAct=eval(strcat('gs',num2str(j)));
        if thisCase(j)
            thisAct=strcat('not(',thisAct,');');
        end
        g(j,:)=eval(thisAct);
        
    end
    c(i+1,:)=g(4,:);
    s(i+1,:)=g(5,:);
    
end


cc=zeros(32,8);
sc=zeros(32,8);

for i=1:32
    cc(i,:)=xor(c(i,:),c_std);
    sc(i,:)=xor(s(i,:),s_std);
end

cF=zeros(6,8);
sF=zeros(6,8);
for i=1:32
    for j=1:8
        cF(numFaultGates(i)+1,j)=cF(numFaultGates(i)+1,j)+cc(i,j);
        sF(numFaultGates(i)+1,j)=sF(numFaultGates(i)+1,j)+sc(i,j);
    end
end

C5=convmatrix(5);
rC5=zeros(6);
for i=1:6
    rC5(i,:)=C5(7-i,:);
end

rcF=rC5'*cF;
rsF=rC5'*sF;
fprintf('x\ty\tz\tPc\n')
for i=1:8
    start=1;
    fprintf('%d\t%d\t%d\t',x(i),y(i),z(i))
    for j=1:6
        if rcF(j,i)>0
            if start==1
                fprintf('%d*E^%d',rcF(j,i),j-1)
                start=0;
            else
                fprintf('+%d*E^%d',rcF(j,i),j-1) 
            end
        else
            if rcF(j,i)<0
                fprintf('%d*E^%d',rcF(j,i),j-1)
            end
        end
        
    end
    %for j=1:6
    %    fprintf('%dE^%d+',rsF(j,i),j-1)
    %end
    fprintf('\n')
end

fprintf('x\ty\tz\tPs\n')
for i=1:8
    start=1;
    fprintf('%d\t%d\t%d\t',x(i),y(i),z(i))
    for j=1:6
        if rsF(j,i)>0
            if start==1
                fprintf('%d*E^%d',rsF(j,i),j-1)
                start=0;
            else
                fprintf('+%d*E^%d',rsF(j,i),j-1) 
            end
        else
            if rsF(j,i)<0
                fprintf('%d*E^%d',rsF(j,i),j-1)
            end
        end
        
    end
    fprintf('\n')
end

end

