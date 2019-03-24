load('matlab.mat');
for i=1:length(S0)
    figure(i)
    clf
    plot(sst(:,i))
end
figure(1)
xlabel('time')
ylabel('Number of X')
title('reaction work with x start with 27')

xPeak=[S0(1,1);1];
j=2;
for i=1:rLength-2
   if  (sst(i+1,1)>sst(i,1))&&(sst(i+1,1)>=sst(i+2,1))
       
       xPeak(:,j)=[sst(i+1,1);i+1];
       j=j+1;
   end
end
xPeak


% clear all
% constant define
x=1;
xp=2;
y=3;
b=4;
ybar=5;
c=6;

slower=1e-60;
slow=1e-30;
medium=1e0;
fast=1e30;
faster=1e60;
%since the loop pattern of 27 is 112 in length, it almost garantee the slow
%reaction fire before faster reaction fire will happen, if choose each
%level have 100-1000x difference speed. And once this happen the later on
%date will make no sence. So I choose a realtive large number

%trialNum=100;
rLength=360000;

%  [x,xp,y,b,ybar,c]
S0=[27,0,0,0,0,0];
l=length(S0);
%finalS=zeros(trialNum,length(S0));
K=[faster,fast,fast,medium,medium,slow,slower,faster,faster,medium];
reactionNum=length(K);

F=zeros(reactionNum,l);
C=F;

F(1,:)=reaction(l,1,ybar,2,x);
C(1,:)=reaction(l,6,b,1,ybar,1,c);

F(2,:)=reaction(l,1,ybar,1,x,1,c);
C(2,:)=reaction(l,1,xp);

F(3,:)=reaction(l,1,xp,1,b);
C(3,:)=reaction(l,1,xp,1,y);

F(4,:)=reaction(l,1,xp);
C(4,:)=reaction(l,4,y);

F(5,:)=reaction(l,6,b);
C(5,:)=reaction(l,1,y);

F(6,:)=reaction(l,1,y);
C(6,:)=reaction(l,1,x);

F(7,:)=reaction(l);
C(7,:)=reaction(l,1,ybar);

F(8,:)=reaction(l,1,y,1,ybar);
C(8,:)=reaction(l,1,y);

F(9,:)=reaction(l,2,ybar);
C(9,:)=reaction(l,1,ybar);

F(10,:)=reaction(l,1,c);
C(10,:)=reaction(l);

wR=zeros(1,reactionNum);
th=zeros(1,reactionNum+1);

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


for i=1:length(S0)
    figure(i)
    clf
    plot(sst(:,i))
end
figure(1)
xlabel('time')
ylabel('Number of X')
title('reaction work with x start with 27')

xPeak=[S0(1,1);1];
j=2;
for i=1:rLength-2
   if  (sst(i+1,1)>sst(i,1))&&(sst(i+1,1)>=sst(i+2,1))
       
       xPeak(:,j)=[sst(i+1,1);i+1];
       j=j+1;
   end
end
xPeak