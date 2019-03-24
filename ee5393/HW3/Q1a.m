trialNum=10000;
s0=[5,5,5];
finalS=zeros(1,length(s0));
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
S=s0;
endMarkBar=1;
while endMarkBar
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
if S(1)>7
    finalS(1,1)=finalS(1,1)+1;
    endMarkBar=0;
elseif S(2)>=8
    finalS(1,2)=finalS(1,2)+1;
    endMarkBar=0;
elseif S(3)<3
    finalS(1,3)=finalS(1,3)+1;
    endMarkBar=0;
end
    

end
j
end


bar(finalS/trialNum)
xlabel('Xi')
ylabel('Probability')
title('final state probility')
for i=1:3
    fprintf('Pr(C%d)=%1.4f\n',i,finalS(i)/trialNum)
end
