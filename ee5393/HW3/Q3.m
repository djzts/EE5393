% constant define
a1=1;
a11=2;
a12=3;
b1=4;
b11=5;
b12=6;
a2=7;
a21=8;
a22=9;
b2=10;
b21=11;
b22=12;
x11=13;
b11p=14;
x12=15;
b12p=16;
x21=17;
b21p=18;
x22=19;
b22p=20;
c1=21;
c2=22;

slow=1;
medium=100;
fast=10000;
faster=1000000;

trialNum=100;
%  [a1,a11,a12,b1,b11,b12,a2,a21,a22,b2,b21,b22,x11,b11',x12,b21',x21,b21',x22,b22',c1,c2]
S0=[1, 0,  0,  3, 0,  0,  2, 0,  0,  4, 0,  0,  0,  0,   0,  0,   0,  0,   0,  0,   0, 0];
l=length(S0);
finalS=zeros(trialNum,length(S0));
K=[faster,faster,faster,faster,slow,faster,fast,medium,slow,faster,fast,medium,slow,faster,fast,medium,slow,faster,fast,medium];
reactionNum=length(K);

F=zeros(reactionNum,l);
C=F;

F(1,:)=reaction(l,1,a1);
C(1,:)=reaction(l,1,a11,1,a12);

F(2,:)=reaction(l,1,b1);
C(2,:)=reaction(l,1,b11,1,b12);

F(3,:)=reaction(l,1,a2);
C(3,:)=reaction(l,1,a21,1,a22);

F(4,:)=reaction(l,1,b2);
C(4,:)=reaction(l,1,b21,1,b22);

F(5,:)=reaction(l,1,a11);
C(5,:)=reaction(l,1,x11);

F(6,:)=reaction(l,1,b11,1,x11);
C(6,:)=reaction(l,1,x11,1,b11p,1,c1);

F(7,:)=reaction(l,1,x11);
C(7,:)=reaction(l);

F(8,:)=reaction(l,1,b11p);
C(8,:)=reaction(l,1,b11);

F(9,:)=reaction(l,1,a12);
C(9,:)=reaction(l,1,x12);

F(10,:)=reaction(l,1,b21,1,x12);
C(10,:)=reaction(l,1,x12,1,b21p,1,c2);

F(11,:)=reaction(l,1,x12);
C(11,:)=reaction(l);

F(12,:)=reaction(l,1,b21p);
C(12,:)=reaction(l,1,b21);

F(13,:)=reaction(l,1,a21);
C(13,:)=reaction(l,1,x21);

F(14,:)=reaction(l,1,b12,1,x21);
C(14,:)=reaction(l,1,x21,1,b12p,1,c2);

F(15,:)=reaction(l,1,x21);
C(15,:)=reaction(l);

F(16,:)=reaction(l,1,b12p);
C(16,:)=reaction(l,1,b12);

F(17,:)=reaction(l,1,a22);
C(17,:)=reaction(l,1,x22);

F(18,:)=reaction(l,1,b22,1,x22);
C(18,:)=reaction(l,1,x22,1,b22p,1,c2);

F(19,:)=reaction(l,1,x22);
C(19,:)=reaction(l);

F(20,:)=reaction(l,1,b22p);
C(20,:)=reaction(l,1,b22);

wR=zeros(1,reactionNum);
th=zeros(1,reactionNum+1);

for j=1:trialNum
S=S0;

for i=1:200
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
            break;
        end
    end

end
finalS(j,:)=S;
j
end


bin=0;
if (max(max(finalS))+1)>length(bin)
    bin(max(max(finalS))+1,length(S0))=0;
end
for i=1:trialNum
    for j=1:length(S0)
       bin(finalS(i,j)+1,j)=bin(finalS(i,j)+1,j)+1;
    end
end

max(finalS)
min(finalS)

plot(linspace(0,length(bin(:,c1))-1,length(bin(:,c1))),bin(:,c1)/trialNum)
hold on
plot(linspace(0,length(bin(:,c2))-1,length(bin(:,c2))),bin(:,c2)/trialNum)

xlabel('Number of C1/C2 at end')
ylabel('Probability')
title('Final state C1/C2 distribution')
