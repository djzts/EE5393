function result=generateN(length, width, ProbilityList)
result=zeros(length,width);
for i=1:length
    for j =1:width
        seed=rand;
        if seed<ProbilityList(i)
            result(i,j)=1;
    end
end
end