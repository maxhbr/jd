module Game.JD.Types.Action
       where
import Game.JD.Types.User
import Game.JD.Types.GameState

class Action action where
  isAllowed :: action -> UserId -> GameState -> Bool
  getImplementation :: action -> GameState -> GameState

type Seed = Int
setup :: Seed -> Action
setup _ = Action

data Setup
  = Setup Seed [UserId]
  deriving (Show)
instance Action Setup where
  isAllowed _ Admin _ = True
  isAllowed _ _ _     = False

  getImplementation (Setup seed uids) _
    = GameState [] [] (Map.fromList (zip uids PlayerState))
