{-# LANGUAGE OverloadedStrings #-}

import Web.Scotty

import Data.Monoid (mconcat)
import System.Environment (getArgs)

main = do
    port <- fmap (read . head) getArgs
    scotty port $ do
        get "/:word" $ do
            beam <- param "word"
            html $ mconcat ["<h1>Scotty, ", beam, " me up!</h1>"]
