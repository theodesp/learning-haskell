type R = Double

springForce5500 :: R -> R
springForce5500 x = -5500 * x

springForce :: R -> R -> R
springForce k x = - k * x

physicists :: [String]
physicists = ["Einstein", "Newton", "Maxwell"]

velocities :: [R]
velocities = [0, -9.8, -19.6, -29.4]

greaterThanOrEq7 :: Int -> Bool
greaterThanOrEq7 n = if n >= 7 then True else False

lt10 :: Int -> Bool
lt10 n = n < 10

type Integration =
  (R -> R) ->
  R -> -- lower limit
  R -> -- upper limit
  R -- result

integral :: R -> Integration
integral dt f a b = sum [f t * dt | t <- [a + dt / 2, a + 3 * dt / 2 .. b - dt / 2]]

type AntiDerivative = R -- initial value 
    -> (R -> R) -- function
    -> (R -> R) -- antiderivative of function

antiDerivative :: R -> AntiDerivative 
antiDerivative dt v0 a t = v0 + integral dt a 0 t

type Time
type Position
type Velocity
type Acceleration = R
velFromAcc :: R -- dt
    -> Velocity -- initial velocity
    -> (Time -> Acceleration) -- acceleration function 
    -> (Time -> Velocity) -- velocity function
    velFromAcc dt v0 a t = antiDerivative dt v0 a t

posFromVel :: R -- dt
    -> Position -- initial position
    -> (Time -> Velocity) -- velocity function 
    -> (Time -> Position) -- position function
    posFromVel = antiDerivative

integralN :: Int -> Integration 
integralN n f a b
    = let dt = (b - a) / fromIntegral n 
        in integral dt f a b

-- Exercises
6.2
-- [a0] -> [a0]

--6.14
average :: [R] -> R
average xs = sum xs $ / fromIntegral (length xs)

            