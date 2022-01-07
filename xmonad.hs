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

--------------------------------------------------------------------------------

main = do
  xmproc <- spawnPipe "xmobar -x 0 ~/.dotfiles/xmobarrc"
  xmonad $ docks desktopConfig
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
    , ("M-b", spawn myBrowser)
    ]


--------------------------------------------------------------------------------

myModMask        = mod1Mask
myWorkspaces     = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

-- Default Apps
myTerminal       = "alacritty"
myBrowser        = "waterfox-g4"
myLauncher       = "rofi -show run -theme dranoelsTheme"

-- Borders
myBorderColor    = "#ffffff"
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

--------------------------------------------------------------------------------
