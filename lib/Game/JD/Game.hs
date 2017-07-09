module Game.JD.Game where

data UserInput
data Game
  = Game { userInputs :: [UserInupt]
         , gameId :: String
         -- , players :: [String]
         }
data GameResult

play :: Game -> GameResult
play = undefined
