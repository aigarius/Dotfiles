import XMonad
import XMonad.Layout.NoBorders
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Util.EZConfig
import XMonad.Hooks.EwmhDesktops


myTerminal = "urxvt"
myWorkspaces = ["Vim", "Web", "IM", "Media", "CLI #1", "CLI #2", "CLI #3", "CLI #4", "CLI #5"]

spawnTerminal = \s -> spawn $ myTerminal ++ " -e " ++ s

main = do
    xmonad $ defaultConfig
        {
          modMask = mod4Mask
        , terminal = myTerminal
        , workspaces = myWorkspaces
        , XMonad.borderWidth = 3
        , XMonad.normalBorderColor = "#333333"
        , XMonad.focusedBorderColor = "#1793d1"
        , layoutHook = avoidStruts . smartBorders $ layoutHook defaultConfig
        , manageHook = composeAll [ isFullscreen --> doFullFloat, manageDocks ]
        , handleEventHook = fullscreenEventHook <+> handleEventHook defaultConfig
        , focusFollowsMouse = False
        }
        `additionalKeysP`
        [
          ("M-p", spawn "dmenu_run -b -nb '#333333' -nf white -sb '#1793d1' -sf white") -- Opens menu.

        , ("M-S-l", spawn "xscreensaver-command -lock") -- Starts the screensaver.

        , ("M-S-v", spawn "gvim") -- Opens the ultimate text editor.
        , ("M-S-i", spawn "chromium") -- Opens the browser.
        , ("M-C-i", spawn "chromium --incognito") -- Opens browser the in incognito mode.
        , ("M-S-s", spawn "skype") -- Opens Skype.
        , ("M-C-s", spawn "skype --dbpath=~/.Skype2") -- Opens the 2nd instance of Skype.
        , ("M-S-x", spawn "ps -aux | grep hexchat | grep -v grep > /dev/null; if [ $? -eq 0 ]; then hexchat -ec 'gui show'; else hexchat; fi") -- Toggles the IRC client.
        , ("M-S-b", spawn "transmission-gtk") -- Opens the torrent client.
        , ("M-S-e", spawn "mousepad") -- Opens the text editor.
        , ("M-S-r", spawnTerminal "ranger") -- Opens the file browser.
        , ("M-S-t", spawn "thunar") -- Opens another file browser.
        , ("M-S-d", spawnTerminal "glances") -- Opens the system profiler.
        , ("M-S-m", spawnTerminal "alsamixer") -- Opens the sound mixer.
        , ("M-S-a", spawnTerminal "ipython2") -- Opens iPython (for Py2).

        , ("<Print>", spawn "xfce4-screenshooter") -- Takes screenshot.
        , ("M-<Print>", spawn "sleep 0.2; scrot '%Y-%m-%d_%X__$wx$h.jpg' -q 90 -e 'mv $f ~/Screenshots/' -s") -- Takes screenshot by selecting area.

        , ("M-,", spawn "Scripts/toggle_trackpad.sh") -- Toggles trackpad.
        , ("M-.", spawn "pkill -USR1 redshift") -- Toggles Redshift.

        , ("M-[", spawn "Scripts/decrement_brightness.sh") -- Decrements brightness.
        , ("M-]", spawn "Scripts/increment_brightness.sh") -- Increments brightness.
        ]
