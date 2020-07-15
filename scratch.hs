-- Scratchpad

main = do
  print "Hello World"

toPart recipient = "Dear " ++ recipient ++ ",\n"
bodyPart bookTitle = "Thanks for buying " ++ bookTitle ++ ".\n"
fromPart author = "Thanks,\n"++author

createEmail recipient title author = toPart recipient ++
                                     bodyPart title ++
                                     fromPart author


let largeNumber = 2^123
                                  