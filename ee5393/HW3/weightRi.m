function [wRi] = weightRi(F,S)
wRi=1;
for i=1:length(S)
    if F(i)>S(i)
        wRi=0;
        break;
    else
        wRi=wRi*nchoosek(S(i),F(i));
    end
end

