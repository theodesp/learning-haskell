type R = Double
type Time = R 
type TimeInterval = R 
type Position = R 
type Velocity = R
type Acceleration = R
type PositionFunction = Time -> Position 
type VelocityFunction = Time -> Velocity

averageVelocity :: Time -> Time -> PositionFunction -> Velocity 
averageVelocity t0 t1 x = (x t1 - x t0) / (t1 - t0)

-- derivatives
-- A derivative takes a function as input and gives a function as output.
type Derivative = (R -> R) -> R -> R

derivative :: R -> Derivative
derivative dt x t = (x (t + dt/2) - x (t - dt/2)) / dt

carPosition :: Time -> Position 
carPosition t = cos t

carVelocity :: Time -> Velocity 
carVelocity = derivative 0.01 carPosition

carVelocity' :: Time -> Velocity
carVelocity' t = derivative 0.01 carPosition t

carVelocityAnalytic :: Time -> Velocity 
carVelocityAnalytic t = -sin t

positionCV :: Position -> Velocity -> Time -> Position 
positionCV x0 v0 t = v0 * t + x0

-- Acceleration is defined to be the rate at which velocity changes.
accFromVel :: R -- dt
    -> (Time -> Velocity) -- velocity function
    -> (Time -> Acceleration) -- acceleration function
accFromVel = derivative

velocityCA :: Velocity -> Acceleration -> Time -> Velocity 
velocityCA v0 a0 t=a0*t+v0

positionCA :: Position -> Velocity -> Acceleration -> Time -> Position
positionCA x0 v0 a0 t = a0 * t**2 / 2 + v0 * t + x0