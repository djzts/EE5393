trialNum=100;
n=512;
r=10;
q=linspace(0,r/2,21);
conQ=zeros(1,21);
for l=1:21
    l
conNum=0;
for k=1:trialNum
    
mobile=r*rand(1,n).*exp(1j*rand(1,n)*2*pi);
mobile(1)=0;
M=zeros(n);
for i=1:n
    for j=i:n
        if abs(mobile(i)-mobile(j))<q(l)
            M(i,j)=1;
            M(j,i)=1;
        end
    end
end
M=M+eye(n);
Mnn=logMpowN(M,n);

    if~any(any(~Mnn))
        conNum=conNum+1;
    end
end
conQ(l)=conNum/trialNum;
end
plot(q/r,conQ)
hold on 
for i=1:length(conQ)
    if(conQ(i)>0.5)
        plot(q(i)/r,conQ(i),'x');
        break;
    end
end

qovr512=q/r;
conQ512=conQ;
thrh512=i/21*0.5;
        
n=[10 30 50 70 90 110 256 512];
po5=zeros(2,length(n));
for i=1:length(n)
    conQ=eval(strcat('conQ',num2str(n(i))));
    qovr=eval(strcat('qovr',num2str(n(i))));
    for j=1:length(conQ)
        if conQ(j)>0.05
            po5(1,i)=j/length(qovr)*max(qovr);
            break;
        end
    end
   for j=1:length(conQ)
        if conQ(length(conQ)+1-j)<0.95
            po5(2,i)=(length(conQ)+1-j)/length(qovr)*max(qovr);
            break;
        end
    end
     
end
po5d=po5(2,:)-po5(1,:);
plot(n,po5d)
hold on
