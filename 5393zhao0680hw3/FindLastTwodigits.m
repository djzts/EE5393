function twodig=FindLastTwodigits(str)

twodig=str2num(char(reverse(extractBefore(reverse(str),3))))
end