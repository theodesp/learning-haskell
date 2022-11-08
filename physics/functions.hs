-- Here we define a constant
e :: Double
e = exp 1

-- Here we define a function
square :: Double -> Double
square x = x**2

-- Anonymous Functions
f = \x -> x**3
g = \x -> cos (2 * x)
v = \t -> 10 * t + 20
h = \x -> exp (-x)

-- Composition
cosSq :: Double -> Double 
cosSq x = square (cos x)

cosSq' :: Double -> Double 
cosSq' x = square $ cos x

cosSq'' :: Double -> Double 
cosSq'' x = (square . cos) x

cosSq''' :: Double -> Double 
cosSq''' = square . cos