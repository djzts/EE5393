clc
up=1e2;
result=zeros(up,3);
time=0;
while(time<up)
    i=0;
    round=0;
    count=[0 0 0];
    initial=[7 9 10];
    states=initial;
while(round<5e4)
    while(i<1e6)
        [states, p] = trans(states) ;
        p=p-[0 p(1) p(2)];
    if(states(1)>10) 
    count=count+[1 0 0];
    break;
    end
    if(states(2)<5) 
    count=count+[0 1 0];
    break;
    end
    if(states(3)>15) 
    count=count+[0 0 1]; 
    break;
    end
    i=i+1; 
    end
    %%disp(states);
    round=round+1;
end
result(time+1,:)=count;
    time=time+1;
end
%disp(result);
prob=mean(result)/round
