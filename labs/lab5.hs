--question 1 
--repli y@(x:xs) a = map (replicate a)  y
 
 --question 2

--filterRepeated []= []
--filterRepeated [a] (x:xs) = if x `elem` xs then filterRepeated a xs else x:[a]
							--where addtonewlist x= x:[]





--question 4 count numeric values in a string

countNumbersRecursive []= 0
countNumbersRecursive (x:xs)= if x `elem` ['0','1','2','3','4','5','6','7','8','9'] then  1 + (countNumbersRecursive xs) else 0+(countNumbersRecursive xs)


--question 5
sumEquation 0= 6
sumEquation j= let i=j in (i**2 +6)/((2*i)+1) + sumEquation (j-1)