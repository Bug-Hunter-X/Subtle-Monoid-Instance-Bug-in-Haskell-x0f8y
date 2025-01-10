{-# LANGUAGE FlexibleInstances #-}

module Main where

import Data.Maybe

class Monoid a where
  mempty :: a
  mappend :: a -> a -> a

instance Monoid (Maybe Int) where
  mempty = Nothing
  mappend Nothing Nothing = Nothing
  mappend (Just x) Nothing = Just x
  mappend Nothing (Just y) = Just y
  mappend (Just x) (Just y) = Just (x + y)

main :: IO ()
main = do
  let x = Just 1
  let y = Just 2
  let z = mappend x y
  print z
  let a = Nothing
  let b = Just 3
  let c = mappend a b
  print c