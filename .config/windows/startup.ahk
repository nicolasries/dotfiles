;keyboard settings
Capslock::Esc

;;; Window Managing
#M::

   WinGet MX, MinMax, A

   If MX
        WinRestore A
   Else WinMaximize A

#q::WinClose A

