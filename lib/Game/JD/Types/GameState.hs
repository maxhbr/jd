module Game.JD.Types.GameState
       where
import           Data.Map
import qualified Data.Map as Map

import Game.JD.Types.User
import Game.JD.Types.Card

data PlayerState
  = PlayerState
  { currendHandCards   :: Cards
  , currendPlayedCards :: Cards }
data GameState
  = GameState
  { currentDeck    :: Deck
  , currentDiscard :: Cards
  , playerStates   :: Map UserId PlayerState }
emptyGameState = GameState [] [] (Map.fromList [])
