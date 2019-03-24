
function Result= Mul(A,B)
    
    A1=Myinv(A);
    B1=Myinv(B);
    len= length(A);
    Result = ones(1,len);
    index=0;
    
    r=A(1);
      
    for i = 1:len-1
    index = find(A==r);
    index = mod(index,len)+1;
    index = find(B==A(index));
    index = mod(index, len)+1;
    index = find(A1==B(index));
    index = mod(index, len)+1;
    index = find(B1==A1(index));
    r = B1(mod(index,len)+1);
    Result(i+1)=r;
    end
      
end