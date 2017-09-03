module UI.AskForSaveFilename
  ( drawAskForSaveFilenameUI
  )
where

import qualified Data.Text as T
import Lens.Micro.Platform

import Brick
import Brick.Widgets.Border
import Brick.Widgets.Center
import Brick.Widgets.Edit

import Types
import Theme

drawAskForSaveFilenameUI :: AppState -> [Widget Name]
drawAskForSaveFilenameUI s = [drawPromptWindow s]

drawPromptWindow :: AppState -> Widget Name
drawPromptWindow s =
    centerLayer $
    borderWithLabel (str "Save") $
        hLimit 60 $
        padLeftRight 2 $ padTopBottom 1 body
    where
        help = hBox [ str "("
                    , withDefAttr keybindingAttr $ str "Enter"
                    , str " to save and quit, "
                    , withDefAttr keybindingAttr $ str "Esc"
                    , str " to quit without saving)"
                    ]
        body = (hCenter $ str "Save changes to:") <=>
               (hCenter help) <=>
               padTopBottom 1 fn
        renderString = txt . T.unlines
        fn = str "Path: " <+> renderEditor renderString True (s^.askToSaveFilenameEdit)