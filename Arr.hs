module Arr where

import Control.Arrow

type MyIoArr a b = Kleisli IO a b

rd :: MyIoArr () String
rd = Kleisli $ \_ -> getLine

pr :: MyIoArr String ()
pr = Kleisli $ \s -> do
  putStrLn s
  return ()

main :: IO ()
main = runKleisli pipe $ ()
  where
    pipe = rd >>> pr

main' :: IO ()
main' = do
  s <- runKleisli rd ()
  runKleisli pr s
