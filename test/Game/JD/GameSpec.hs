module Game.JD.GameSpec where
import SpecHelper
import Game.JD.Game

-- TODO: move to helpers
isSuccessFull :: GameResult -> Bool
isSuccessFull (GameResult (Left _)) = False
isSuccessFull (GameResult (Right _)) = True

spec :: Spec
spec = describe "Game" $ do
       it "play empty game should succeed" $ do
         isSuccessFull (play emptyGame) `shouldBe` True

main :: IO ()
main = hspec $ spec
