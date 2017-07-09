module Game.JD.Types.User
       where

--------------------------------------------------------------------------------
-- * Users and user-related stuff
data UserId
  = U String -- ^ regular user, determined by its username
  | Admin -- ^ administrative user (is not allowed to play)
  | Guest -- ^ unauthorized user
  deriving (Show,Eq,Read)
