nameScore :: (String,Int) 
nameScore = ("Albert Einstein", 79)

type R = Double
pythag :: (R,R) -> R
pythag (x,y) = sqrt (x**2 + y**2)

pythagCurried :: R -> R -> R 
pythagCurried x y = sqrt (x**2 + y**2)

fst3 :: (a,b,c) -> a 
fst3 (x,y,z) = x

snd3 :: (a,b,c) -> b 
snd3 (_,y,_) = y

thd3 :: (a,b,c) -> c 
thd3 (_x,_y,z) = z

findFirstMaybe :: (b -> Bool) -> [b] -> Maybe b
findFirstMaybe p xs = case dropWhile (not . p) xs of 
    [] -> Nothing
    (x:_) -> Just x

grades :: [(String, Int)]
grades = [ ("Albert Einstein", 89)
    , ("Isaac Newton" , 95)
    , ("Alan Turing" , 91) ]

yRock30 :: R -> R
yRock30 t = 30 * t - 0.5 * 9.8 * t**2

txPairs :: [(R,R)]
txPairs = [(t,yRock30 t) | t <- [0,0.1..6]]

txPairsInAir :: [(R,R)] 
txPairsInAir
    = [(t,yRock30 t) | t <- [0,0.1..20], yRock30 t > 0]

txPairsInAir'' :: [(R,R)] 
txPairsInAir''
    = filter (\(_t,y) -> y > 0) $
    map (\t -> (t,yRock30 t)) [0,0.1..20]

-- type constructor
-- An object that takes zero or more types as input and produces a type as output.

type List a = [a]
type Function a b = a -> b 
type Pair a b = (a,b)
type Triple a b c = (a,b,c)

oneStep :: R -- time step
    -> (R -> R) -- function to integrate 
    -> (R,R) -- current (t,y)
    -> (R,R) -- updated (t,y)
oneStep dt f (t,y) = let t' = t + dt 
            y' = y + f t * dt
        in (t',y')