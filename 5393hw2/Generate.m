function Result= Generate(permutation)
len= length(permutation);
Result = ones(1,len);

index = find(permutation==1);

    for i= 1:len
        Result(i)=permutation(index);
        index=mod(index,len)+1;
    end
end