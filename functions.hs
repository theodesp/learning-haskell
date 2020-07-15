module Main where

average :: Float -> Float -> Float
average a b = (a + b) / 2.0

showResult :: Int -> String
showResult x = "The result is " ++ (show x)

square :: Float -> Float
square x = x * x

circleArea :: Float -> Float
circleArea x = pi * (square x)

showAreaOfCircle :: Float -> String
showAreaOfCircle x = "The area of a circle with radius " ++ (show x) ++ "cm is about " ++ (show (circleArea x)) ++ "cm^2"

main = do
    print (5 `average` 4)
    print (showResult 123)
    print (showAreaOfCircle 5.0)
   
