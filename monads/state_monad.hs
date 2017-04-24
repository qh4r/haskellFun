import Control.Monad.State

-- data State stateType stateComputationResult
-- instance Monad (State s)
-- actions
-- get :: State s s
-- put :: s ->  State s ()
-- evalState :: State s a -> s -> a

harmonicStep :: State (Double, Double) Double
harmonicStep = do
    (position, velocity) <- get
    let acceleration = (-0.01 * position)
        velocity' = velocity + acceleration
        position' = position + velocity'
    put (position', velocity')
    return position


iterateStep :: State (Double, Double) [Double]
iterateStep = do
    position <- harmonicStep
    later <- iterateStep
    return (position : later)

positions = evalState iterateStep (1,0) -- koniecznie uzywac z take np take 10