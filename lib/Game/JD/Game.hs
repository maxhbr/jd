module Game.JD.Game where
import Game.JD.Types.User

data UserInput
data Game
  = Game { userInputs :: [UserInput]
         , gameId     :: String
         , players    :: [UserId]
         }
emptyGame = Game [] "emptyGame" [] :: Game

data FailedGameResult
  = FailedGameResult
data SuccessfullGameResult
  = SuccessfullGameResult
data GameResult = GameResult (Either FailedGameResult
                                     SuccessfullGameResult)

play :: Game -> GameResult
play (Game [] _ _) = GameResult (Right SuccessfullGameResult)
