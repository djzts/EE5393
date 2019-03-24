clear all
% constant define
x=1;
xp=2;
xbar=3;
y=4;
yp=5;
ybar=6;
z=7;



slow=1;
medium=1e3;
fast=1e6;
faster=1e9;


trialNum=100;
%  [x,xp,xbar,y,yp,ypbar,z]
S0=[66,0,0,30,0,0,0];
l=length(S0);
finalS=zeros(trialNum,length(S0));
K=[slow,fast,fast,medium,medium,slow,faster,faster,slow,faster,faster];
reactionNum=length(K);

F=zeros(reactionNum,l);
C=F;

F(1,:)=reaction(l,1,x,1,y);
C(1,:)=reaction(l,1,z);

F(2,:)=reaction(l,1,xbar,1,z);
C(2,:)=reaction(l,1,xp,1,xbar);

F(3,:)=reaction(l,1,ybar,1,z);
C(3,:)=reaction(l,1,yp,1,ybar);

F(4,:)=reaction(l,1,xp);
C(4,:)=reaction(l,1,x);

F(5,:)=reaction(l,1,yp);
C(5,:)=reaction(l,1,y);

F(6,:)=reaction(l);
C(6,:)=reaction(l,1,xbar);

F(7,:)=reaction(l,1,x,1,xbar);
C(7,:)=reaction(l,1,x);

F(8,:)=reaction(l,2,xbar);
C(8,:)=reaction(l,1,xbar);

F(9,:)=reaction(l);
C(9,:)=reaction(l,1,ybar);

F(10,:)=reaction(l,1,y,1,ybar);
C(10,:)=reaction(l,1,y);

F(11,:)=reaction(l,2,ybar);
C(11,:)=reaction(l,1,ybar);

th=zeros(1,reactionNum+1);

rLength=600;
rN=zeros(1,rLength);
%for j=1:trialNum
S=S0;
sst=zeros(rLength,length(S0));
for i=1:rLength
    sst(i,:)=S;
    totalWeight=0;
    for k=1:reactionNum
        wR(k)=K(k)*weightRi(F(k,:),S);
        totalWeight=totalWeight+wR(k);
    end
    if ~any(wR)
        break;
    end
    th(1)=0;
    thisStep=rand;
    for k=1:reactionNum
        th(k+1)=th(k)+wR(k)/totalWeight;
        if thisStep<th(k+1)
            S=fireRi(F(k,:),C(k,:),S);
            rN(i)=k;
            break;
        end
    end
end

[linspace(1,length(rN),length(rN));rN]

for i=1:7
    figure(i)
    clf
    plot(sst(:,i))
end

figure(1)
xlabel('time')
ylabel('x Num')
title('input 1 (66) - time')
figure(4)
xlabel('time')
ylabel('t Num')
title('input 2 (30) - time')
