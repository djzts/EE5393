trialNum=3;

n=50;
m=25;



p=linspace(0,1,51);
conP=zeros(1,length(p));
for j=1:length(p)
    j
counter=0;

for i=1:trialNum
    counter=counter+Q4a(n,m,p(j));
end
conP(j)=counter/trialNum;

end
plot(p,conP)
conPn50m25=struct('conP',conP,'p',p)

