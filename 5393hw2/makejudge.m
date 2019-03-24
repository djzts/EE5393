function resultlist = makejudge(result,sub,indexR)
    strA = "C B C! B!";
    strB = "C D C! D!";
    strC = "D E D! E!";
    strD = "E B E! B!";
    strE = "D A D! A!";
    strA1 = "B C B! C!";
    strB1 = "C D C! D!";
    strC1 = "D E D! E!";
    strD1 = "E B E! B!";
    strE1 = "D A D! A!";
    strnull= "* * * *";
    switch result
    case 'A'
            
            dispstr=[];
            subresult = strsplit(strA);
            for i=1:length(indexR)
                 dispstr=[dispstr;sub];
            end
                        
    case 'B'
            dispstr=[];
            subresult = strsplit(strB);
            for i=1:length(indexR)
                 dispstr=[dispstr;sub];
            end
            
    case 'C'
            dispstr=[];
            subresult = strsplit(strC);
            for i=1:length(indexR)
                 dispstr=[dispstr;sub];
            end
            
    case 'D'
            dispstr=[];
            subresult = strsplit(strD);
            for i=1:length(indexR)
                 dispstr=[dispstr;sub];
            end
            
            dispstr=[];
            subresult = strsplit(strE);
            for i=1:length(indexR)
                 dispstr=[dispstr;sub];
            end
            
    case 'A!'
            
            dispstr=[];
            subresult = strsplit(strA1);
            for i=1:length(indexR)
                 dispstr=[dispstr;sub];
            end
            
            
    case 'B!'
            dispstr=[];
            subresult = strsplit(strB1);
            for i=1:length(indexR)
                 dispstr=[dispstr;sub];
            end
            
    case 'C!'
            dispstr=[];
            subresult = strsplit(strC1);
            for i=1:length(indexR)
                 dispstr=[dispstr;sub];
            end
            
    case 'D!'
            dispstr=[];
            subresult = strsplit(strD1);
            for i=1:length(indexR)
                 dispstr=[dispstr;sub];
            end
            
    case 'E!'
            dispstr=[];
            subresult = strsplit(strE1);
            for i=1:length(indexR)
                 dispstr=[dispstr;sub];
            end
             
    end
    subresult2 = strsplit(strnull);
    resultlist=[dispstr,subresult',subresult2'];
end