-- Scratchpad

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