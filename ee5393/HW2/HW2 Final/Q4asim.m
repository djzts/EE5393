trialNum=10;

n=70;
m=int64(linspace(1,n,20));
p=linspace(0,1,20);
[MM,PP]=meshgrid(m,p);
conP=zeros(length(MM),length(PP));
for i=1:length(MM)
    for j=1:length(PP)
        [i,j]
        counter=0;
        for k=1:trialNum
            counter=counter+Q4a(n,MM(i,j),PP(i,j));
        end
        conP(i,j)=counter/trialNum;
    end
end
surf(MM,PP,conP)
conPn70=struct('MM',MM,'PP',PP,'conP',conP);
