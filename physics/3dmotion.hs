{-# OPTIONS -Wall #-}
module SimpleVec where

infixl 6 ^+^
infixl 6 ^-^
infixr 7 *^
infixl 7 ^*
infixr 7 ^/
infixr 7 <.>
infixl 7 ><

type R = Double
type VecDerivative = (R -> Vec) -> R -> Vec

vecDerivative :: R -> VecDerivative
vecDerivative dt v t = (v (t + dt/2) ^-^ v (t - dt/2)) ^/ dt

v1 :: R -> Vec
v1 t = 2 *^ t**2 *^ iHat ^+^ 3 *^ t**3 *^ jHat ^+^ t**4 *^ kHat

xCompFunc :: (R -> Vec) -> R -> R 
xCompFunc v t = xComp (v t)

type Derivative = (R -> R) -> R -> R
derivative :: R -> Derivative
derivative dt x t = (x (t + dt/2) - x (t - dt/2)) / dt

type Time= R
type PosVec= Vec
type Velocity= Vec
type Acceleration = Vec

velFromPos :: R -- dt
    -> (Time -> PosVec ) -- position function 
    -> (Time -> Velocity) -- velocity function
velFromPos = vecDerivative

accFromVel :: R -- dt
    -> (Time -> Velocity) -- velocity function
    -> (Time -> Acceleration) -- acceleration function
accFromVel = vecDerivative

positionCV :: PosVec -> Velocity -> Time -> PosVec 
positionCV r0 v0 t = v0 ^* t ^+^ r0
