module Game.JD.GameSpec where
import SpecHelper
import Game.JD.Game
import Game.JD.Types.User

-- TODO: move to helpers
isSuccessFull :: GameResult -> Bool
isSuccessFull (GameResult (Left _)) = False
isSuccessFull (GameResult (Right _)) = True

spec :: Spec
spec = describe "Game" $ do
       it "play empty game should succeed" $ do
         isSuccessFull (play emptyGame) `shouldBe` True
       it "play initted game should succeed" $ let
         game = (emptyGame <>> (Admin `does` setup))
         in isSuccessFull (play game) `shouldBe` True
       it "only Admin should be allowed to setup a game" $ let
         game = (emptyGame <>> (Guest `does` setup))
         in isSuccessFull (play game) `shouldBe` False

main :: IO ()
main = hspec $ spec
