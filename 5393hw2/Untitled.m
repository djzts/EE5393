%% Q2
clc
A = [1 4 3 5 2];
B = [1 4 5 2 3];
C = [1 3 4 2 5];
D = [1 2 4 5 3];
E = [1 4 2 3 5];



str= "(x y)! (x!)!%";
chr= char(str)
result='A!';






%%


indexL = strfind(str,'(');
indexR = strfind(str,')');
len = length(chr);
sub=[];
flag=[];
for i=1:length(indexL)
    if chr(indexR(i)+1)=='!'
    sub = [sub;extractBetween(chr, indexL(i),indexR(i)+1)];
    
    else
    sub = [sub;extractBetween(chr, indexL(i),indexR(i))];
    
    end
 
end


%%

makejudge(result,sub,indexR)
   

   
%%

    
 


