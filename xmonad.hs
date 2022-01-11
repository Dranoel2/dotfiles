import XMonad
import XMonad.Layout.ToggleLayouts
import XMonad.Layout.Grid
import XMonad.Util.Run
import XMonad.Hooks.ManageDocks
import XMonad.Config.Desktop (desktopConfig)
import XMonad.Util.EZConfig (additionalKeys)
import System.Exit
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
import XMonad.Util.SpawnOnce
import XMonad.Layout.ResizableTile (ResizableTall(..))
import XMonad.Util.EZConfig
import XMonad.Actions.PhysicalScreens
import Data.Default
import qualified XMonad.StackSet as W

--------------------------------------------------------------------------------

main = do
  xmproc <- spawnPipe "xmobar -x 0 ~/.dotfiles/xmobarrc"
  xmonad $ docks def
    { modMask            = myModMask
    , normalBorderColor  = myBorderColor
    , focusedBorderColor = myFocusedColor
    , terminal           = myTerminal
    , borderWidth        = myBorderWidth
    , workspaces         = myWorkspaces
    , focusFollowsMouse  = True
    , clickJustFocuses   = False

    , layoutHook         = myLayouts
    , logHook            = myLogHook
    , handleEventHook    = myEventHook
    , manageHook         = myManageHook
    , startupHook        = myStartupHook
    }
    `additionalKeysP`
    [ ("M-f", sendMessage ToggleLayout)

    , ("M-p", spawn myLauncher)
    , ("M-S-b", spawn myBrowser)

    , ("M-]", onNextNeighbour def W.view)
    , ("M-[", onPrevNeighbour def W.view)
    , ("M-S-]", do
      onNextNeighbour def W.shift
      onNextNeighbour def W.view
      )
    , ("M-S-[", do
      onPrevNeighbour def W.shift
      onPrevNeighbour def W.view
      )
    ]


--------------------------------------------------------------------------------

myModMask        = mod4Mask
myWorkspaces     = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

-- Default Apps
myTerminal       = "alacritty"
myBrowser        = "waterfox-g4"
myLauncher       = "rofi -show run -theme dranoelsTheme"

-- Borders
myBorderColor    = "#282c34"
myFocusedColor   = "#00f0ff"
myBorderWidth    = 5

--------------------------------------------------------------------------------

myLayouts = toggleLayouts (noBorders Full) (avoidStruts (myTallLayout ||| myGridLayout))
  where
    myTallLayout = spacing 5 $ Tall 1 (2/100) (2/3)
    myGridLayout = spacing 5 $ Grid

--------------------------------------------------------------------------------

myManageHook = composeAll
  [

  ]

--------------------------------------------------------------------------------

myEventHook = mempty

--------------------------------------------------------------------------------

myLogHook = return ()

--------------------------------------------------------------------------------

myStartupHook = do
  spawnOnce "nitrogen --restore &"
  spawnOnce "picom &"
  spawnOnce "stalonetray &"

--------------------------------------------------------------------------------
