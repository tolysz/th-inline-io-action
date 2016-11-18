{-# Language TemplateHaskell #-}

module Language.Haskell.TH.InlineIO
 (inlineIOAction)
where

import qualified Language.Haskell.TH.Syntax as TH

-- | Execute some IO action during compilation only then return the value,
-- from the application perspective it will be a static value
inlineIOAction :: TH.Lift a => (IO a) -> TH.Q (TH.TExp a)
inlineIOAction act = do
  a <- TH.runIO act
  [|| a ||]
