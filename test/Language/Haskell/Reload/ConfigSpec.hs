{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module Language.Haskell.Reload.ConfigSpec (spec) where

import           Language.Haskell.Reload.Config

import           Data.Aeson
import           Test.Hspec


spec :: Spec
spec = do
  describe "get format command" $ do
    it "get default command" $ do
      formatCommand Nothing `shouldBe` "stylish-haskell"
      formatCommand (decode "{}") `shouldBe` "stylish-haskell"
      formatCommand (decode "{\"editor\":{}}") `shouldBe` "stylish-haskell"
      formatCommand (decode "{\"editor\":{\"actions\":{}}}") `shouldBe` "stylish-haskell"
    it "get explicit command" $ do
      formatCommand (decode "{\"editor\":{\"actions\":{\"format\":\"fmt\"}}}") `shouldBe` "fmt"
