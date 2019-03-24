trialNum=10000;
finalS=zeros(trialNum,3);
F1=[2 1 0];
C1=[0 0 4];
F2=[1 0 2];
C2=[0 3 0];
F3=[0 1 1];
C3=[2 0 0];

k1=1;
k2=2;
k3=3;



for j=1:trialNum
S=[6,6,6];

for i=1:5
wR1=k1*weightRi(F1,S);
wR2=k2*weightRi(F2,S);
wR3=k3*weightRi(F3,S);

totalWeight=wR1+wR2+wR3;
th1=wR1/totalWeight;
th2=(wR1+wR2)/totalWeight;
thisStep=rand;
if thisStep<th1
    S=fireRi(F1,C1,S);
else
    if thisStep<th2
        S=fireRi(F2,C2,S);
    else
        S=fireRi(F3,C3,S);
    end
end
end
finalS(j,:)=S;
end
bin=0;
if (max(max(finalS))+1)>length(bin)
    bin(max(max(finalS))+1,3)=0;
end
for i=1:trialNum
    for j=1:3
       bin(finalS(i,j)+1,j)=bin(finalS(i,j)+1,j)+1;
    end
end

max(finalS)
min(finalS)
for i=1:3
    figure(i)
    clf;
    bar(linspace(0,length(bin(:,i))-1,length(bin(:,i))),bin(:,i)/trialNum)
    title(strcat('X',num2str(i),' PMF'))
    xlabel('Quantity of X')
    ylabel('Probability')
end
figure(4)
for i=1:3
    hold on 
    plot(linspace(0,length(bin(:,i))-1,length(bin(:,i))),bin(:,i)/trialNum)

end
xlabel('Quantity of Xi')
ylabel('Probability')
title('Xi Probability distribution')

for i=1:3
    for j=1:length(bin(:,i))
        fprintf('Pr[X%1d=%d]=%1.4f\n',i,j,bin(j,i)/trialNum);
    end
    fprintf('\n')
end


