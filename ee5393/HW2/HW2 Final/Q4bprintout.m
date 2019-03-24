load('matlab.mat')

clc;
clf;
n=[10 30 50 70 90 110 256 512];
figure(1)
clf;
t=linspace(0,1,101);
for i=1:length(n)
    condQ=eval(strcat('conQ',num2str(n(i))));
    hold on
    thisQ=eval(strcat('qovr',num2str(n(i))));
    plot(thisQ,condQ,'b')
    y=0.5+0.5*tanh((t-1.5*n(i).^(-1/3))*3/((2.4)^(2/5)*n(i).^(-1/2)));
    hold on 
    plot(t,y,'r');
end
plotThrh=[thrh10 thrh30 thrh50 thrh70 thrh90 thrh110 thrh256 thrh512];
xlabel('q/r ratio');
ylabel('blue:simulation, red:calculated')


figure(2)
clf;
plot(n,plotThrh,'b');
hold on
t=linspace(10,600,101);
ThrhCenterPoint=1.5*t.^(-1/3);
plot(t,ThrhCenterPoint,'r')
xlabel('n')
ylabel('blue:simulation red calculated')
title('critical threshold (0.5) change vs n')


figure(3)
clf;
n=[10 30 50 70 90 110 256 512];
t=linspace(10,600,101);
plot(n,po5d,'b');
transcastionWidth=(2.4)^(2/5)*t.^(-1/2);
hold on
plot(t,transcastionWidth,'r')
xlabel('n')
ylabel('blue:simulation red calculated')
title('transcastion Width (0.05-0.95) change vs n')

figure(4)
clf;
x=linspace(0,1,101);
y=linspace(10,600,101);
[XX,YY]=meshgrid(x,y);
ZZ=0.5+0.5*tanh((XX-1.5*YY.^(-1/3))*3./((2.4)^(2/5)*YY.^(-1/2)));
surf(XX,YY,ZZ)
xlabel('q/r ratio')
ylabel('n')
zlabel('P Probability that each user is connected')