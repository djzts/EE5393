clear all 
a1=[0 0 0 0 1 1 1 1 ];
 a2=[0 0 1 1 0 0 1 1 ];
 a3=[0 1 0 1 0 1 0 1 ];
 A=[a1;a2;a3];
 F(1,:)=and(a2,or(not(a1),not(a3)));
 F(2,:)=and(not(a1),and(a2,a3));
 F(3,:)=or(not(a1),or(not(a2),a3));
 F(4,:)=or(a1,and(a2,a3));
 F(5,:)=and(a3,or(a1,not(a2)));
 F(6,:)=and(a3,or(a1,a2));
 F(7,:)=or(not(a1),and(a2,not(a3)));
 F(8,:)=or(and(not(a1),not(a3)),not(a2));
 l=1;
 result=[];
 for k=1:8
    for i=1:3
        f=F(k,:);
        f1a1(i,:)=and(f,A(i,:));
        f1a1(i+3,:)=or(f,A(i,:));
        f1a1(i+6,:)=not(and(f,A(i,:)));
        f1a1(i+9,:)=not(or(f,A(i,:)));
        f1a1(i+12,:)=and(f,not(A(i,:)));
        f1a1(i+15,:)=or(f,not(A(i,:)));
        f1a1(i+18,:)=not(and(f,not(A(i,:))));
        f1a1(i+21,:)=not(or(f,not(A(i,:))));
    end
    for i=1:24
        for j=1:8
            if (F(j,:)==(f1a1(i,:)))
                if j~=k
                    result(l,:)=[k i j];
                    l=l+1;
                end
            end
        end
    end
 end
 result

for a=1:24
    a
if (1+mod(a-1,12))>6
    b='N';
else
    b='';
end

if (1+mod(a-1,6))>3
    b=strcat(b,'OR');
else
    b=strcat(b,'AND');
end
if a>12
    b=strcat(b,' not ');
end
b=strcat(b,' A',num2str(1+mod(a-1,3)))
end
    

