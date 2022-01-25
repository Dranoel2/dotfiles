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
import XMonad.Layout.Tabbed
import XMonad.Layout.MultiColumns

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

    , ("M-s", spawn myScreenshot)
    , ("M-S-s", spawn myPartScreenshot)

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
myScreenshot     = "scrot ~/Pictures/Screenshots/%Y-%m-%d-%T.png"
myPartScreenshot = "scrot -s ~/Pictures/Screenshots/%Y-%m-%d-%T.png"

-- Borders
myBorderColor    = "#2e3440"
myFocusedColor   = "#88C0D0"
myBorderWidth    = 5

--------------------------------------------------------------------------------

myLayouts = toggleLayouts (noBorders Full) ( avoidStruts (myTallLayout ||| myColumnLayout) )
  where
    myTallLayout = spacing 5 $ Tall 1 (2/100) (2/3)
    myColumnLayout = multiCol [1] 1 0.01 (-0.5)

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
  spawnOnce "feh --bg-scale --randomize ~/Pictures/backgrounds &"
  spawnOnce "picom &"
  spawnOnce "stalonetray &"
  spawnOnce "dunst &"
  spawnOnce "discord --start-minimized &"
  spawnOnce "lxsession &"

--------------------------------------------------------------------------------
