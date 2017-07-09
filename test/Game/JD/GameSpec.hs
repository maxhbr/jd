module Game.JD.GameSpec where
import SpecHelper
import Game.JD.Game

spec :: Spec
spec = describe "Game" $ do
       it "play empty game should succeed" $ do
         isSuccessFull (play emptyGame) `shouldBe` True

main :: IO ()
main = hspec $ spec
