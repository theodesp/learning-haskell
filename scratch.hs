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
                                  