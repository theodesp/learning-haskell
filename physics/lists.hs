type R = Double

physicists :: [String]
physicists = ["Einstein","Newton","Maxwell"]

velocities :: [R]
velocities = [0,-9.8,-19.6,-29.4]

moreVelocities :: [R] 
moreVelocities = [-39.2,-49.0]

ns :: [Int] 
ns = [0..10]

square :: R -> R 
square x = x**2

funcs :: [R -> R]
funcs = [cos,square,sin]

-- type Variables

oneDouble :: Double 
oneDouble = 1

twoInt :: Int 
twoInt = 2

-- list comprehensions
ts :: [R]
ts = [0,0.1..6]

yRock30 :: R -> R
yRock30 t = 30 * t - 0.5 * 9.8 * t**2

-- for every value of ts called t, run yRock30 t and save in a list
xs :: [R]
xs = [yRock30 t | t <- ts]

sndItem3 :: [a] -> a 
sndItem3 ys = case ys of
    [] -> error "Empty list has no second element." 
    (x:[]) -> error "1-item list has no 2nd item." 
    (x:z:_) -> z

sndItem4 :: [a] -> a
sndItem4 [] = error "Empty list has no second element." 
sndItem4 (x:[]) = error "1-item list has no 2nd item." 
sndItem4 (x:z:_) = z


-- Exercises
--5.1
numbers :: [R]
numbers = [-2.0,-1.2..2.0]

--5.3
length "Hello, world!" -- 13

--5.8
[9,1,-7,-15,-23] -- take 5 [9,1..]

--5.12
1.6349839001848923 -- result = sum [1/x**2 | x <- [1..100]]