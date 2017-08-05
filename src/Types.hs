{-# LANGUAGE TemplateHaskell #-}
module Types
  ( Mode(..)
  , Name(..)
  , Coord

  , AppState(..)
  , drawing
  , canvasSize
  , mode
  , drawingFrozen

  , blankCharacter
  )
where

import Data.Array.IO (IOUArray)
import Data.Array.Unboxed (UArray)
import Lens.Micro.TH

data Mode = Main
          deriving (Eq, Show)

data Name = Canvas
          deriving (Eq, Show, Ord)

type Coord = (Int, Int)

blankCharacter :: Char
blankCharacter = ' '

data AppState =
    AppState { _drawing       :: IOUArray Coord Char
             , _drawingFrozen :: UArray Coord Char
             , _canvasSize    :: (Int, Int)
             , _mode          :: Mode
             }

makeLenses ''AppState
