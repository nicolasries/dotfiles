; start bug.n
;#include win-10-virtual-desktop-enhancer
Run, "%A_WorkingDir%\win-10-virtual-desktop-enhancer\virtual-desktop-enhancer.ahk", %A_WorkingDir%\win-10-virtual-desktop-enhancer\

;keyboard settings
Capslock::Esc

;;; Window Managing
#M::

   WinGet MX, MinMax, A

   If MX
        WinRestore A
   Else WinMaximize A

#q::WinClose A



;#d::Run, Firefox.exe
;MsgBox This hotkey is now owned by the script.
;return
