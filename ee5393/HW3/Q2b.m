trialNum=100;
%  [a'b'c'x x'z a y y']
S0=[0,1,0,16,0,0,0,1,0];
finalS=zeros(trialNum,length(S0));
%   a'b'c'x x'z a y y'
F=[ 0 1 0 0 0 0 0 0 0
    1 0 0 2 0 0 0 0 0
    0 0 2 0 0 0 0 0 0
    1 0 0 0 0 0 0 0 0
    0 0 0 0 1 0 0 0 0
    0 0 1 0 0 0 0 0 0
    0 0 0 0 0 1 0 0 0
    0 0 0 0 0 0 1 1 0
    0 0 0 0 0 0 1 0 0
    0 0 0 0 0 0 0 0 1];
C=[ 1 1 0 0 0 0 0 0 0
    1 0 1 0 1 0 0 0 0
    0 0 1 0 0 0 0 0 0
    0 0 0 0 0 0 0 0 0
    0 0 0 1 0 0 0 0 0
    0 0 0 0 0 1 0 0 0
%   a'b'c'x x'z a y y'
    0 0 0 0 0 0 1 0 0
    0 0 0 0 0 0 1 0 2
    0 0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 1 0];



slow=1;
medium=100;
fast=10000;
faster=1000000;

K=[slow,faster,faster,fast,medium,medium,slow,faster,fast,medium];


reactionNum=length(K);
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
plot(linspace(0,length(bin(:,8))-1,length(bin(:,8))),bin(:,8)/trialNum)
xlabel('Y inf')
ylabel('Probability')

 