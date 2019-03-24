function Result= Myinv(permutation)
len= length(permutation);
Result = ones(1,len);
    for i= 1:len-1
    Result(i+1)=permutation(len-i+1);
    end
end