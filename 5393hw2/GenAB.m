function [x1,x2]= GenAB(permutation)

count=0;

x1=Generate(randperm(5,5));
x2=Generate(randperm(5,5));

while(norm(permutation-trans(trans(trans(x1,x2),Myinv(x1)),Myinv(x2)))~=0)
    x2=Generate(randperm(5,5));
    
    if count>1e3
        x1=Generate(randperm(5,5));
        count=0;
    end
    count=count+1;
end
end