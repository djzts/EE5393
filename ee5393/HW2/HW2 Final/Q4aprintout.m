 load('matlabQ4a.mat')
n=[20 30 40 50 70 100];
ctn=zeros(length(n),101);
for i=1:length(n)
    str=strcat('conPn',num2str(n(i)));
    conP=eval(strcat(str,'.conP'));
    PP=eval(strcat(str,'.PP'));
    MM=eval(strcat(str,'.MM'));
    ct=zeros(1,length(PP));
    figure(i+1);
    clf;
    surf(PP,MM,conP)
    xlabel('p')
    ylabel('m')
    zlabel('P')
    title(strcat('N=',num2str(n(i))));
    for j=1:length(PP)
        for k=1:length(PP)
            if(conP(k,j)>0.5)
                ct(j)=k/length(PP);
                break;
            end
        end
    end
    ctn(i,:)=interp1(linspace(0,1,length(ct)),ct,linspace(0,1,101));
end
bsM=linspace(0,1,101);
[NN,bsMM]=meshgrid(n,bsM);
figure(1)
clf;
surf(NN,bsMM,ctn')
    
ylabel('m/n')
xlabel('n')
zlabel('critical threshold')
title('critical threshold as a function of m,n')