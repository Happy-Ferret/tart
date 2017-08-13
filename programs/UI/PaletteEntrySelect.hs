module UI.PaletteEntrySelect
  ( drawPaletteEntrySelectUI
  )
where

import Data.Monoid ((<>))
import Brick
import Lens.Micro.Platform

import Types
import UI.Main
import UI.Common

drawPaletteEntrySelectUI :: AppState -> [Widget Name]
drawPaletteEntrySelectUI s =
    let isFg = case s^.mode of
          FgPaletteEntrySelect -> True
          BgPaletteEntrySelect -> False
          m -> error $ "BUG: should never get called in mode " <> show m
        pal = drawPalette s isFg
    in pal <> drawMainUI s