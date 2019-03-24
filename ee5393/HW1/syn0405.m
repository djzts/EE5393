function [  ] = syn0405(t)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
shift=0;
tOri=t;
action=[];
actionIndex=1;

    while 1
        if abs(t-round(t))<0.00001
            break;
        end
        shift=shift+1;
        t=t*10;
    end
    
while 1
    if or((t==4),(t==5))
        break;
    end
    
    if (t/10^shift)>0.5
        t=10^shift-t;
        action(actionIndex)=0;
        actionIndex=actionIndex+1;
    else 
        thisDigit=rem(t,10);
        if rem(thisDigit,2)
            t=t*2;
            action(actionIndex)=2;
            actionIndex=actionIndex+1;
        else
            if (t*2.5)<10^shift
                t=t*2.5;
                action(actionIndex)=1;
                actionIndex=actionIndex+1;
            else
                t=t*2;
                action(actionIndex)=2;
                actionIndex=actionIndex+1;
            end
        end
    end
    while 1
        if rem(t,10)==0
            t=t/10;
            shift=shift-1;
        else
            break;
        end
    end
end

t=tOri;
nextT=0;
fprintf('t = %1.5f\n',t);
for i=1:actionIndex-1
    if action(i)==0
        nextT=1-t;
        fprintf('%1.4f = 1-%1.4f\n',t,nextT);
    elseif action(i)==1
        nextT=t*2.5;
        fprintf('%1.4f = 0.4 * %1.4f\n',t,nextT);
    elseif action(i)==2
        nextT=t*2;
        fprintf('%1.4f = 0.5 * %1.4f\n',t,nextT);
    end
    t=nextT;
end
    

end

