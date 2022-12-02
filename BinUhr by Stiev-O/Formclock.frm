VERSION 5.00
Begin VB.Form Form1 
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   0  'Kein
   Caption         =   "Aktuelle Uhrzeit"
   ClientHeight    =   840
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   2175
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   MouseIcon       =   "Formclock.frx":0000
   MousePointer    =   99  'Benutzerdefiniert
   Picture         =   "Formclock.frx":0152
   ScaleHeight     =   840
   ScaleWidth      =   2175
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows-Standard
   Begin VB.PictureBox picMin 
      Appearance      =   0  '2D
      AutoRedraw      =   -1  'True
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   0  'Kein
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   0
      MouseIcon       =   "Formclock.frx":22E4
      MousePointer    =   99  'Benutzerdefiniert
      Picture         =   "Formclock.frx":2436
      ScaleHeight     =   255
      ScaleWidth      =   2175
      TabIndex        =   1
      Top             =   600
      Width           =   2175
   End
   Begin VB.PictureBox picHour 
      Appearance      =   0  '2D
      AutoRedraw      =   -1  'True
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   0  'Kein
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   0
      MouseIcon       =   "Formclock.frx":DB90
      MousePointer    =   99  'Benutzerdefiniert
      Picture         =   "Formclock.frx":DCE2
      ScaleHeight     =   255
      ScaleWidth      =   2175
      TabIndex        =   0
      Top             =   0
      Width           =   2175
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   500
      Left            =   360
      Top             =   1920
   End
   Begin VB.Label lblDblPoint 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   ":"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   300
      Left            =   960
      TabIndex        =   2
      Top             =   300
      Width           =   90
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Declare Function ReleaseCapture Lib "user32" () As Long

Private Declare Function SendMessage Lib "user32" Alias _
        "SendMessageA" (ByVal hwnd As Long, ByVal wMsg _
        As Long, ByVal wParam As Long, lParam As Any) As Long

Private Const HTCAPTION = 2
Private Const WM_NCLBUTTONDOWN = &HA1
Private Const WM_SYSCOMMAND = &H112


Const HWND_TOPMOST = -1
Const HWND_NOTOPMOST = -2
Const SWP_NOSIZE = &H1
Const SWP_NOMOVE = &H2
Const SWP_NOACTIVATE = &H10
Const SWP_SHOWWINDOW = &H40
Private Declare Sub SetWindowPos Lib "user32" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, ByVal X As Long, ByVal Y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long)

Private Type binTime
    binHour(0 To 3) As Byte
    binMin(0 To 5) As Byte
End Type

Dim myBinTime As binTime

Dim sCurrTime As String

Private Sub CreateBinaryTime()
Dim i As Integer
Dim iHour As Integer
Dim iMin As Integer
iHour = IIf(Hour(Now) > 12, Hour(Now) - 12, Hour(Now))
iMin = Minute(Now)

For i = 3 To 0 Step -1
    If iHour >= (2 ^ i) Then
        myBinTime.binHour(i) = 1
        iHour = iHour - (2 ^ i)
    Else
        myBinTime.binHour(i) = 0
    End If
Next

For i = 5 To 0 Step -1
    If iMin >= (2 ^ i) Then
        iMin = iMin - (2 ^ i)
        myBinTime.binMin(i) = 1
    Else
        myBinTime.binMin(i) = 0
    End If
Next
       
End Sub
Private Sub PaintBinaryTime()
Dim i As Integer
Dim sCTime As String
For i = 3 To 0 Step -1
    sCTime = sCTime & myBinTime.binHour(i)
Next
sCTime = sCTime & ":"
For i = 5 To 0 Step -1
    sCTime = sCTime & myBinTime.binMin(i)
Next
If sCTime <> sCurrTime Then
    sCurrTime = sCTime
    PutToPicBox
End If
End Sub
Private Sub PutToPicBox()
Dim i As Integer
picHour.Cls
picMin.Cls


For i = 3 To 0 Step -1
    If myBinTime.binHour(i) = 1 Then
        picHour.Line (-i * 10, 15)-(-(i - 1) * 10 - 2, 45), vbGreen, BF
        picHour.Line (-i * 10 + 1, 24)-(-(i - 1) * 10 - 3, 28), RGB(200, 255, 200), BF
    Else
        picHour.Line (-i * 10, 15)-(-(i - 1) * 10 - 2, 45), vbWhite, BF
        picHour.Line (-i * 10, 15)-(-(i - 1) * 10 - 2, 45), vbGreen, B
    End If
Next
For i = 5 To 0 Step -1
    If myBinTime.binMin(i) = 1 Then
        picMin.Line (-i * 10, 15)-(-(i - 1) * 10 - 2, 45), vbGreen, BF
        picMin.Line (-i * 10 + 1, 24)-(-(i - 1) * 10 - 3, 28), RGB(200, 255, 200), BF
    Else
        picMin.Line (-i * 10, 15)-(-(i - 1) * 10 - 2, 45), vbWhite, BF
        picMin.Line (-i * 10, 15)-(-(i - 1) * 10 - 2, 45), vbGreen, B
    End If
Next

End Sub


Private Sub Form_DblClick()
Unload Me
End Sub

Private Sub Form_Load()
picHour.Scale (-40, 0)-(40, 60)
picMin.Scale (-60, 0)-(20, 60)
Me.Left = Screen.Width - Me.Width
Me.Top = 0
lblDblPoint.Left = Me.ScaleWidth / 2 - lblDblPoint.Width / 2
SetWindowPos Me.hwnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOACTIVATE Or SWP_SHOWWINDOW Or SWP_NOMOVE Or SWP_NOSIZE
CreateBinaryTime
PaintBinaryTime
Timer1.Enabled = True
End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Button = 0 Then Exit Sub
    Call ReleaseCapture
    SendMessage Me.hwnd, WM_NCLBUTTONDOWN, HTCAPTION, 0&

End Sub

Private Sub picHour_DblClick()
Unload Me
End Sub

Private Sub picHour_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Button = 0 Then Exit Sub
    Call ReleaseCapture
    SendMessage Me.hwnd, WM_NCLBUTTONDOWN, HTCAPTION, 0&
End Sub

Private Sub picMin_DblClick()
Unload Me
End Sub

Private Sub picMin_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Button = 0 Then Exit Sub
    Call ReleaseCapture
    SendMessage Me.hwnd, WM_NCLBUTTONDOWN, HTCAPTION, 0&

End Sub

Private Sub Timer1_Timer()
CreateBinaryTime
PaintBinaryTime

If Second(Now) Mod 2 = 0 Then
    lblDblPoint.Visible = False
Else
    lblDblPoint.Visible = True
End If
picHour.ToolTipText = Format$(Now, "hh:nn:ss")
picMin.ToolTipText = Format$(Now, "hh:nn:ss")
End Sub
