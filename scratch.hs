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