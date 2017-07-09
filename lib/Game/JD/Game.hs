module Game.JD.Game where

import           Data.Map
import qualified Data.Map as Map

import Game.JD.Types.User
import Game.JD.Types.Card
import Game.JD.Types.GameState

data Action
  = Action

type Seed = Int
setup :: Seed -> Action
setup _ = Action

----------------------------------------------------------------------

data UserInput
  = UserInput
does :: UserId -> Action -> UserInput
does _ _ = UserInput
-- Admin `does` Init 3
---- game is fully setuped
-- U "Player1" `does` Scout
-- U "Player2" `does` (Play (Card "cid1") (Card "cid2"))
---- All players have chosen
-- U "Player2" `does` (PayWith [(Card "cid3"),(Card "cid4")]
-- U "Player2" `does` (PayWith [(Card "cid5")]
---- Income
-- U "Player2" `does` (Play (Card "cid1") (Card "cid2"))
-- U "Player1" `does` Scout
---- All players have chosen
-- ....

----------------------------------------------------------------------

data Game
  = Game { userInputs :: [UserInput]
         , gameId     :: String
         , players    :: [UserId]
         }
emptyGame = Game [] "emptyGame" []

(<>>) :: Game -> UserInput -> Game
(<>>) (g@Game{userInputs = uis}) ui = g{userInputs = (uis ++ [ui])}

----------------------------------------------------------------------
-- calculateIncome :: GameState -> Map UserId Int

-- validActions :: GameState -> UserId -> [Action]
-- isAllowed :: (Action, UserId) -> GameState -> Bool

----------------------------------------------------------------------
data FailedGameResult
  = FailedGameResult
data SuccessfullGameResult
  = SuccessfullGameResult GameState
data GameResult = GameResult (Either FailedGameResult
                                     SuccessfullGameResult)

play :: Game -> GameResult
play (Game [] _ _) = GameResult (Right (SuccessfullGameResult emptyGameState))
play (Game _ _ _)  = GameResult (Right (SuccessfullGameResult emptyGameState))
