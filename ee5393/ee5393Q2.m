clc
X1=zeros(1,30);
X2=zeros(1,30);
X3=zeros(1,30);

for num=243:485
    G=mod(dec2base(num ,3),3);
    accumulate=ones(1,3);
    rec=0;
    initial=[6 6 6];
    states=initial;
for i=1:5
        [states, p, flag] = trans2(states,G(i+1));
        %if flag==1
            %rec=1;
            %break;
        %end
        accumulate=accumulate(G(i)+1).*p;
        %^ pause(1)
end


if (states(1)>=0 && states(2)>=0 && states(3)>=0)
    %disp(accumulate);
    %disp([num,G(2:end) ]);
    %disp(states);
    X1(states(1)+1)=X1(states(1)+1)+accumulate(1);
    X2(states(2)+1)=X2(states(2)+1)+accumulate(2);
    X3(states(3)+1)=X3(states(3)+1)+accumulate(3);
end
%pause(0.5);
end
disp([sum(X1),sum(X2),sum(X3)])