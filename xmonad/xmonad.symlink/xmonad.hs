import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO
import XMonad.Hooks.SetWMName
import XMonad.Layout.NoBorders
import XMonad.Hooks.ManageHelpers

main = do
    xmproc <- spawnPipe "trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --width 10 --transparent true --tint black --height 24&"
    xmproc <- spawnPipe"nm-applet&"
    xmproc <- spawnPipe"xscreensaver -nosplash&"
    xmproc <- spawnPipe"xmobar ~/.xmonad/xmobarrc"
    xmonad $ defaultConfig
        { manageHook = manageDocks <+> (isFullscreen --> doFullFloat) <+> manageHook defaultConfig
        , layoutHook = avoidStruts $ layoutHook defaultConfig
	, startupHook = setWMName "LG3D"
	, terminal = "gnome-terminal"
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "green" "" . shorten 50
                        }
        , modMask = mod4Mask     -- Rebind Mod to the Windows key
        } `additionalKeys`
        [ ((mod4Mask, xK_v), spawn "xscreensaver-command -lock")
		, ((mod4Mask, xK_p), spawn "synapse")
        , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
        , ((0, xK_Print), spawn "scrot")
        ]
