#!/bin/sh

CMD="sudo ./xhyverun.sh && exit"

if [ "${TERM_PROGRAM}" = "Apple_Terminal" ] ; then
  osascript <<END
    tell application "Terminal"
      do script "cd $(pwd); ${CMD}"
    end tell
END
elif [ "${TERM_PROGRAM}" = "iTerm.app" ] ; then
  osascript <<END
    tell application "iTerm"
      tell application "System Events" to keystroke "d" using {shift down, command down}
      tell application "System Events" to keystroke "[" using {command down}
      tell the last session of current terminal
        write text "${CMD}"
      end tell
    end tell
END
fi
