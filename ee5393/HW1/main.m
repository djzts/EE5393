fprintf('Problem 1:\n')
B5=binmatrix(5)
f=1/3*[1 -1 1 -1 1 -1]'
CKT=inv(B5)*f
fprintf('CKT is the probability input to the MUX highest order first\n')
fprintf('Check:')
X=linspace(0,1,5)
fprintf('The desire output is follow for listed X:\n')
targetFunction(X)
fprintf('My circuit output is :\n')
P1SI(X)
fprintf('Same\n\n\n')
fprintf('Problem 2:\n')
problem2Print()
fprintf('Problem 3(a):\n')
syn0405dec(6555,10000)
syn0405dec(6666,10000)
syn0405dec(1111,10000)
fprintf('Problem 3(b):\n')
syn0405(1/4)
syn0405(3/4)
syn0405(5/16)
syn0405(11/16)
syn0405(27/64)
fprintf('Problem 3(c):\n')
prompt = 'What is the value you want to synthesize (accept fraction -1 for exit)? \nx = ';
while 1
    x=input(prompt);
    if x==-1
        break;
    end
    if (x>=0)&&(x<=1)
        syn0405(x)
    else
        fprintf('x shoule belong to [0,1], try again \n')
    end
end
clear all

