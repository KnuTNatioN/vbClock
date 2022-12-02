Attribute VB_Name = "modTopMost"
Option Explicit

Private Declare Function SetWindowPos Lib "user32.dll" ( _
    ByVal hWnd As Long, _
    ByVal hWndInsertAfter As Long, _
    ByVal x As Long, _
    ByVal y As Long, _
    ByVal cx As Long, _
    ByVal cy As Long, _
    ByVal wFlags As Long _
) As Long

' 'SetWindowPos' flags.
Private Const SWP_NOSIZE As Long = &H1&
Private Const SWP_NOMOVE As Long = &H2&
Private Const SWP_NOZORDER As Long = &H4&
Private Const SWP_NOREDRAW As Long = &H8&
Private Const SWP_NOACTIVATE As Long = &H10&
Private Const SWP_FRAMECHANGED As Long = &H20&      ' The frame changed: Send 'WM_NCCALCSIZE'.
Private Const SWP_SHOWWINDOW As Long = &H40&
Private Const SWP_HIDEWINDOW As Long = &H80&
Private Const SWP_NOCOPYBITS As Long = &H100&
Private Const SWP_NOOWNERZORDER As Long = &H200&    ' Don't do owner Z ordering.

Private Const SWP_DRAWFRAME As Long = SWP_FRAMECHANGED
Private Const SWP_NOREPOSITION As Long = SWP_NOOWNERZORDER

' 'SetWindowPos' 'hwndInsertAfter' values.
Private Const HWND_TOP As Long = 0&
Private Const HWND_BOTTOM As Long = 1&
Private Const HWND_TOPMOST As Long = -1&
Private Const HWND_NOTOPMOST As Long = -2&

Private Const FLAGS As Long = SWP_NOMOVE Or SWP_NOSIZE

Private Declare Function GetWindowLong Lib "user32.dll" Alias "GetWindowLongA" ( _
    ByVal hWnd As Long, _
    ByVal nIndex As Long _
) As Long
     
Private Const WS_EX_TOPMOST As Long = &H8&
Private Const GWL_EXSTYLE As Long = -20&

Public Enum TopStatus
    tpsAlwaysOnTop = True
    tpsDefault = False
End Enum

Public Sub SetTopMost(ByVal Form As Form, ByVal TopStatus As TopStatus)
    If TopStatus = tpsAlwaysOnTop Then
        Call SetWindowPos(Form.hWnd, HWND_TOPMOST, 0&, 0&, 0&, 0&, FLAGS)
    Else
        Call SetWindowPos(Form.hWnd, HWND_NOTOPMOST, 0&, 0&, 0&, 0&, FLAGS)
    End If
End Sub

Public Function GetTopMost(ByVal Form As Form) As TopStatus
    GetTopMost = _
        ( _
            (GetWindowLong(Form.hWnd, GWL_EXSTYLE) And WS_EX_TOPMOST) = WS_EX_TOPMOST _
        )
End Function
