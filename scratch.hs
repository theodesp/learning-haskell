-- Scratchpad

import Data.List

main = do
  print "Hello World"

toPart recipient = "Dear " ++ recipient ++ ",\n"
bodyPart bookTitle = "Thanks for buying " ++ bookTitle ++ ".\n"
fromPart author = "Thanks,\n"++author

largeNumber = 2^123

createEmail recipient title author = toPart recipient ++
                                     bodyPart title ++
                                     fromPart author

calcChange owed given = if change > 0
                        then change
                        else 0
  where change = given - owed

ident = \x -> x

sumSquareOrSquareSum x y = if sumSquare > squareSum
                           then sumSquare
                           else squareSum
  where sumSquare = x^2 + y^2
        squareSum = (x+y)^2

overwrite x = let x = 2
              in
                let x = 3
                in
                  let x = 4
                  in
                    x

author = ("Will","Kurt")

names = [("Ian", "Curtis"), ("Bernard","Sumner"), ("Peter", "Hook"), ("Stephen","Morris")]

sorted = sort names

compareLastNames name1 name2 = if lastName1 > lastName2
                               then GT
                               else if lastName1 < lastName2
                                 then LT
                                 else EQ
  where lastName1 = snd name1
        lastName2 = snd name2

sortedByLastName = sortBy compareLastNames names

sfOffice name = if lastName < "L"
                then nameText ++ " - PO Box 1234 - San Francisco, CA, 94111"
                else nameText ++ " - PO Box 1010 - San Francisco, CA, 94109"
  where lastName = snd name
        nameText = (fst name) ++ " " ++ lastName

nyOffice name = nameText ++ ": PO Box 789 - New York, NY, 10013"
  where nameText = (fst name) ++ " " ++ (snd name)

renoOffice name = nameText ++ " - PO Box 456 - Reno, NV 89523"
  where nameText = snd name

getLocationFunction location = case location of
  "ny" -> nyOffice
  "sf" -> sfOffice
  "reno" -> renoOffice
  _ -> (\name -> (fst name) ++ " " ++ (snd name))

addressLetter name location = locationFunction name
  where locationFunction = getLocationFunction location

add4 a b c d = a + b + c + d

addressLetterV2 location name = addressLetter name location

flipBinaryArgs binaryFunction = (\x y -> binaryFunction y x)

subtract2from = flip subtract
subtract2 x = subtract2from 2 x

numbers = [1] ++ [2,3,4]

lazyNumbers = [1 .. 10]

decreasingNumbers = [1,0 .. -10]

backwardsInfinity = reverse [1..]

takeFirst = [1,2,3] !! 0

sizeofList = length [1..20]

isPalindrome word = word == reverse word

takeLast n aList = reverse (take n (reverse aList))

zipped = zip [1,2,3] [2,4,6]

ones n = take n (cycle [1])

assignToGroups n aList = zip groups aList
  where groups = cycle [1..n]

repeat x = take x $ cycle [x]

subseq :: Int -> Int -> [a] -> [a]
subseq x y list = take (y - x) (drop x list)

myGCD a b = if remainder == 0
            then b
            else myGCD b remainder
  where remainder = a `mod` b

isEmpty [] = True
isEmpty _ = False

myHead (x:xs) = x
myHead [] = error "No head for empty list"

myTail [] = error "No tail for empty list"
myTail (_:xs) = xs

myDrop :: Int -> [a] -> [a]
myDrop _ [] = []
myDrop n ls = if n == 0
                then ls
                else
                myDrop (n - 1) (tail ls)

myTake _ [] = []
myTake 0 _ = []
myTake n (x:xs) = x:rest
  where rest = myTake (n - 1) xs

myCycle (first:rest) = first:myCycle (rest++[first])
