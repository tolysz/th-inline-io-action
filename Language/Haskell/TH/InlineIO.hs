{-# Language TemplateHaskell #-}

module Language.Haskell.TH.InlineIO
 (inlineIOAction)
where

import qualified Language.Haskell.TH.Syntax as TH

inlineIOAction :: TH.Lift a => (IO a) -> TH.Q (TH.TExp a)
inlineIOAction act = do
  a <- TH.runIO act
  [|| a ||]
