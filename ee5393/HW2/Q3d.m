x1d5=zeros(32,5);
for i=1:32
    for j=1:5
        x1d5(i,j)=mod(int64(-0.500001+i/(2^(5-j))),2);
    end
end
x1d5
XOR15=zeros(1,32);
for i=1:32
    XOR15(i)=xor(x1d5(i,1),xor(x1d5(i,2),xor(x1d5(i,3),xor(x1d5(i,4),x1d5(i,5)))));
end
XOR15
pos=zeros(16,5);
posPointer=0;
neg=zeros(16,5);
negPointer=0;
for i=1:32
    if XOR15(i)==1
        posPointer=posPointer+1;
        pos(posPointer,:)=x1d5(i,:);
    else
        negPointer=negPointer+1;
        neg(negPointer,:)=x1d5(i,:);
    end
end

for i=1:5
    for j=1:16
        fprintf('x%1d',i);
        if ~pos(j,i)
            fprintf('\"');
        end
        fprintf('\t');
        
    end
    fprintf('\n');
end
sw=zeros(16);
swbar=zeros(16);
for i=1:16
    for j=1:16
        for k=1:5
            if pos(i,k)==pos(j,k)
                sw(i,j)=k;
                swbar(i,j)=pos(i,k);
                break;
            end
        end
    end
end

for i=1:16
    for j=1:16
        fprintf('x%1d',sw(i,j));
        if ~swbar(i,j)
            fprintf('\"')
        end
        fprintf('\t');
    end
    fprintf('\n');
end


for j=1:16
    for i=1:5
        fprintf('x%1d',i);
        if ~pos(j,i)
            fprintf('\"');
        end
        
        
    end
    fprintf('\n');
end
