VERSION 5.00
Begin VB.Form Form1 
   AutoRedraw      =   -1  'True
   BackColor       =   &H00000000&
   BorderStyle     =   4  'Festes Werkzeugfenster
   Caption         =   "Binaer Uhr"
   ClientHeight    =   2535
   ClientLeft      =   16200
   ClientTop       =   1020
   ClientWidth     =   2895
   ControlBox      =   0   'False
   FillColor       =   &H80000001&
   ForeColor       =   &H8000000F&
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   167.604
   ScaleMode       =   0  'Benutzerdefiniert
   ScaleWidth      =   193
   Begin VB.TextBox Text1 
      Alignment       =   2  'Zentriert
      Height          =   285
      Left            =   240
      TabIndex        =   0
      Text            =   "Uhrzeit Normal"
      Top             =   2160
      Visible         =   0   'False
      Width           =   2415
   End
   Begin VB.Frame Frame3 
      BackColor       =   &H00000000&
      Caption         =   " 32     16     8         4      2      1    "
      ForeColor       =   &H00FFFFFF&
      Height          =   615
      Left            =   120
      TabIndex        =   4
      ToolTipText     =   "Sekunden"
      Top             =   1440
      Width           =   2655
      Begin VB.Shape Shape32s 
         Height          =   135
         Left            =   240
         Top             =   240
         Width           =   135
      End
      Begin VB.Shape Shape16s 
         Height          =   135
         Left            =   600
         Top             =   240
         Width           =   135
      End
      Begin VB.Shape Shape8s 
         Height          =   135
         Left            =   960
         Top             =   240
         Width           =   135
      End
      Begin VB.Shape Shape4s 
         Height          =   135
         Left            =   1440
         Top             =   240
         Width           =   135
      End
      Begin VB.Shape Shape2s 
         Height          =   135
         Left            =   1800
         Top             =   240
         Width           =   135
      End
      Begin VB.Shape Shape1s 
         BackColor       =   &H0000FF00&
         Height          =   135
         Left            =   2160
         Top             =   240
         Width           =   135
      End
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   500
      Left            =   4320
      Top             =   960
   End
   Begin VB.CommandButton ClockRe 
      Caption         =   "UHRZEIT Aktualisieren"
      Height          =   735
      Left            =   3720
      TabIndex        =   3
      Top             =   120
      Width           =   1575
   End
   Begin VB.Frame Frame2 
      BackColor       =   &H00000000&
      Caption         =   " 32     16     8         4      2      1    "
      ClipControls    =   0   'False
      ForeColor       =   &H00FFFFFF&
      Height          =   615
      Left            =   120
      TabIndex        =   1
      ToolTipText     =   "Minuten"
      Top             =   720
      Width           =   2655
      Begin VB.Shape Shape1m 
         Height          =   135
         Left            =   2160
         Top             =   240
         Width           =   135
      End
      Begin VB.Shape Shape2m 
         Height          =   135
         Left            =   1800
         Top             =   240
         Width           =   135
      End
      Begin VB.Shape Shape4m 
         Height          =   135
         Left            =   1440
         Top             =   240
         Width           =   135
      End
      Begin VB.Shape Shape8m 
         Height          =   135
         Left            =   960
         Top             =   240
         Width           =   135
      End
      Begin VB.Shape Shape16m 
         Height          =   135
         Left            =   600
         Top             =   240
         Width           =   135
      End
      Begin VB.Shape Shape32m 
         Height          =   135
         Left            =   240
         Top             =   240
         Width           =   135
      End
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00000000&
      Caption         =   "8      4      2      1"
      ForeColor       =   &H00FFFFFF&
      Height          =   615
      Left            =   720
      TabIndex        =   2
      ToolTipText     =   "Stunden"
      Top             =   0
      Width           =   1455
      Begin VB.Shape Shape8 
         Height          =   135
         Left            =   120
         Top             =   240
         Width           =   135
      End
      Begin VB.Shape Shape4 
         FillColor       =   &H0000FF00&
         Height          =   135
         Left            =   480
         Top             =   240
         Width           =   135
      End
      Begin VB.Shape Shape2 
         BorderColor     =   &H00000000&
         Height          =   135
         Left            =   840
         Top             =   240
         Width           =   135
      End
      Begin VB.Shape Shape1 
         BackColor       =   &H00000000&
         FillColor       =   &H80000001&
         Height          =   135
         Left            =   1200
         Top             =   240
         Width           =   135
      End
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Zentriert
      BackStyle       =   0  'Transparent
      Caption         =   "Binaer Uhr"
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   240
      TabIndex        =   5
      Top             =   2160
      Width           =   2415
   End
   Begin VB.Menu menu 
      Caption         =   "Men�"
      Index           =   1
      Begin VB.Menu clockset 
         Caption         =   "Uhr Einstellungen"
         Shortcut        =   ^U
      End
      Begin VB.Menu alwaysTop 
         Caption         =   "Immer im Vordergrund"
      End
      Begin VB.Menu end 
         Caption         =   "Beenden"
      End
   End
   Begin VB.Menu uber 
      Caption         =   "?"
      Begin VB.Menu about 
         Caption         =   "�ber"
      End
      Begin VB.Menu sos 
         Caption         =   "Hilfe"
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Const tit = "Bin�r Uhr"
Dim usrnam As String
Dim sekunden
Dim minuten
Dim stunden
Dim realstunden
Dim shapecolor
Dim Style3
Dim result
Dim Text
Private Sub alwaysTop_Click()
    If (MsgBox("Bin�ruhr immer im Vordergrund?", vbYesNo, tit) = vbYes) Then
            Form1.TopMost = True
    Else
            Form1.TopMost = False
End If
End Sub
Private Sub Form_Load()
Form1.TopMost = True
Timer1.Enabled = True
Style3 = 3
Form2.Shape1.Shape = 3
shapecolor = &HFF00&
'Shape1
Shape1.Shape = Style3
Shape1.FillStyle = 1
Shape1.FillColor = shapecolor
'----Shape Ende----'
'Shape2
Shape2.Shape = Style3
Shape2.FillStyle = 1
Shape2.FillColor = shapecolor
'----Shape Ende----'
'Shape3
Shape4.Shape = Style3
Shape4.FillStyle = 1
Shape4.FillColor = shapecolor
'----Shape Ende----'
'Shape4
Shape8.Shape = Style3
Shape8.FillStyle = 1
Shape8.FillColor = shapecolor
'----Shape Ende----'
'Shape5
Shape32m.Shape = Style3
Shape32m.FillStyle = 1
Shape32m.FillColor = shapecolor
'----Shape Ende----'
'Shape6
Shape16m.Shape = Style3
Shape16m.FillStyle = 1
Shape16m.FillColor = shapecolor
'----Shape Ende----'
'Shape7
Shape8m.Shape = Style3
Shape8m.FillStyle = 1
Shape8m.FillColor = shapecolor
'----Shape Ende----'
'Shape
Shape4m.Shape = Style3
Shape4m.FillStyle = 1
Shape4m.FillColor = shapecolor
'----Shape Ende----'
'Shape9
Shape2m.Shape = Style3
Shape2m.FillStyle = 1
Shape2m.FillColor = shapecolor
'----Shape Ende----'
'Shape10
Shape1m.Shape = Style3
Shape1m.FillStyle = 1
Shape1m.FillColor = shapecolor
'----Shape Ende----'
'sekunde Change
Shape1s.Shape = Style3
Shape1s.FillStyle = 1
Shape1s.FillColor = shapecolor
'n�chster Shape
Shape2s.Shape = Style3
Shape2s.FillStyle = 1
Shape2s.FillColor = shapecolor
'n�chster Shape
Shape4s.Shape = Style3
Shape4s.FillStyle = 1
Shape4s.FillColor = shapecolor
'n�chster Shape
Shape8s.Shape = Style3
Shape8s.FillStyle = 1
Shape8s.FillColor = shapecolor
'n�chster Shape
Shape16s.Shape = Style3
Shape16s.FillStyle = 1
Shape16s.FillColor = shapecolor
'n�chster Shape
Shape32s.Shape = Style3
Shape32s.FillStyle = 1
Shape32s.FillColor = shapecolor
'END SHAPE
End Sub
Sub UnloadForms()
If MsgBox(" M�chten Sie die Bin�rUhr wirklich Beenden?", vbYesNo, "Bin�rUhr Beenden?") = vbYes Then
  Dim F As Form
  For Each F In Forms
    Unload F
  Next F
Else
'es Geschied nichts =)
End If
End Sub


Public Property Let TopMost(ByVal Value As Boolean)
    Call SetTopMost(Form1, Value)
End Property

Public Property Get TopMost() As Boolean
    TopMost = GetTopMost(Form1)
End Property

Private Sub clockset_Click()
Form2.Show
End Sub

Sub TIMETIMETIME()
zeit = Split(Time, ":")
stunden = zeit(0)
minuten = zeit(1)
sekunden = zeit(2)
'SHAPES AUF NULL SETZEN
Shape1.FillStyle = 1
Shape2.FillStyle = 1
Shape4.FillStyle = 1
Shape8.FillStyle = 1
Shape1m.FillStyle = 1
Shape2m.FillStyle = 1
Shape4m.FillStyle = 1
Shape8m.FillStyle = 1
Shape16m.FillStyle = 1
Shape32m.FillStyle = 1
Shape1s.FillStyle = 1
Shape2s.FillStyle = 1
Shape4s.FillStyle = 1
Shape8s.FillStyle = 1
Shape16s.FillStyle = 1
Shape32s.FillStyle = 1
'SHAPES AUF NULL SETZEN ENDE
If stunden > 12 Then
realstunden = stunden - 12
shapecolor = &HFF&
Else
realstunden = stunden
shapecolor = &HFF00&
End If
Text1.Text = Now
End Sub

Private Sub Comtime_Click()
Shape1.FillStyle = 0
End Sub

Private Sub ClockRE_Click()
Call TIMETIMETIME
Call stunde
Call minute
Call sekunde
End Sub

Private Sub end_Click()
Call UnloadForms
End Sub
Sub stunde()
'--Stunden--'
If realstunden = 1 Then
Form1.Shape1.FillStyle = 0
End If
If realstunden = 2 Then
Form1.Shape2.FillStyle = 0
End If
If realstunden = 3 Then
Form1.Shape1.FillStyle = 0
Form1.Shape2.FillStyle = 0
End If
If realstunden = 4 Then
Form1.Shape4.FillStyle = 0
End If
If realstunden = 5 Then
Form1.Shape1.FillStyle = 0
Form1.Shape4.FillStyle = 0
End If
If realstunden = 6 Then
Form1.Shape2.FillStyle = 0
Form1.Shape4.FillStyle = 0
End If
If realstunden = 7 Then
Form1.Shape1.FillStyle = 0
Form1.Shape2.FillStyle = 0
Form1.Shape4.FillStyle = 0
End If
If realstunden = 8 Then
Form1.Shape8.FillStyle = 0
End If
If realstunden = 9 Then
Form1.Shape1.FillStyle = 0
Form1.Shape8.FillStyle = 0
End If
If realstunden = 10 Then
Form1.Shape2.FillStyle = 0
Form1.Shape8.FillStyle = 0
End If
If realstunden = 11 Then
Form1.Shape1.FillStyle = 0
Form1.Shape2.FillStyle = 0
Form1.Shape8.FillStyle = 0
End If
If realstunden = 12 Then
Form1.Shape4.FillStyle = 0
Form1.Shape8.FillStyle = 0
End If
'Stunden Ende
End Sub
Sub minute()
If minuten = 1 Then
Form1.Shape1m.FillStyle = 0
End If
If minuten = 2 Then
Form1.Shape2m.FillStyle = 0
End If
If minuten = 3 Then
Form1.Shape2m.FillStyle = 0
Form1.Shape1m.FillStyle = 0
End If
If minuten = 4 Then
Form1.Shape4m.FillStyle = 0
End If
If minuten = 5 Then
Form1.Shape4m.FillStyle = 0
Form1.Shape1m.FillStyle = 0
End If
If minuten = 6 Then
Form1.Shape4m.FillStyle = 0
Form1.Shape2m.FillStyle = 0
End If
If minuten = 7 Then
Form1.Shape4m.FillStyle = 0
Form1.Shape2m.FillStyle = 0
Form1.Shape1m.FillStyle = 0
End If
If minuten = 8 Then
Form1.Shape8m.FillStyle = 0
End If
If minuten = 9 Then
Form1.Shape8m.FillStyle = 0
Form1.Shape1m.FillStyle = 0
End If
If minuten = 10 Then
Form1.Shape8m.FillStyle = 0
Form1.Shape2m.FillStyle = 0
End If
If minuten = 11 Then
Form1.Shape8m.FillStyle = 0
Form1.Shape2m.FillStyle = 0
Form1.Shape1m.FillStyle = 0
End If
If minuten = 12 Then
Form1.Shape8m.FillStyle = 0
Form1.Shape4m.FillStyle = 0
End If
If minuten = 13 Then
Form1.Shape8m.FillStyle = 0
Form1.Shape4m.FillStyle = 0
Form1.Shape1m.FillStyle = 0
End If
If minuten = 14 Then
Form1.Shape8m.FillStyle = 0
Form1.Shape4m.FillStyle = 0
Form1.Shape2m.FillStyle = 0
End If
If minuten = 15 Then
Form1.Shape8m.FillStyle = 0
Form1.Shape4m.FillStyle = 0
Form1.Shape2m.FillStyle = 0
Form1.Shape1m.FillStyle = 0
End If
If minuten = 16 Then
Form1.Shape16m.FillStyle = 0
End If
If minuten = 17 Then
Form1.Shape16m.FillStyle = 0
Form1.Shape1m.FillStyle = 0
End If
If minuten = 18 Then
Form1.Shape16m.FillStyle = 0
Form1.Shape2m.FillStyle = 0
End If
If minuten = 19 Then
Form1.Shape16m.FillStyle = 0
Form1.Shape2m.FillStyle = 0
Form1.Shape1m.FillStyle = 0
End If
If minuten = 20 Then
Form1.Shape16m.FillStyle = 0
Form1.Shape4m.FillStyle = 0
End If
If minuten = 21 Then
Form1.Shape16m.FillStyle = 0
Form1.Shape4m.FillStyle = 0
Form1.Shape1m.FillStyle = 0
End If
If minuten = 22 Then
Form1.Shape16m.FillStyle = 0
Form1.Shape4m.FillStyle = 0
Form1.Shape2m.FillStyle = 0
End If
If minuten = 23 Then
Form1.Shape16m.FillStyle = 0
Form1.Shape4m.FillStyle = 0
Form1.Shape2m.FillStyle = 0
Form1.Shape1m.FillStyle = 0
End If
If minuten = 24 Then
Form1.Shape16m.FillStyle = 0
Form1.Shape8m.FillStyle = 0
End If
If minuten = 25 Then
Form1.Shape16m.FillStyle = 0
Form1.Shape8m.FillStyle = 0
Form1.Shape1m.FillStyle = 0
End If
If minuten = 26 Then
Form1.Shape16m.FillStyle = 0
Form1.Shape8m.FillStyle = 0
Form1.Shape2m.FillStyle = 0
End If
If minuten = 27 Then
Form1.Shape16m.FillStyle = 0
Form1.Shape8m.FillStyle = 0
Form1.Shape2m.FillStyle = 0
Form1.Shape1m.FillStyle = 0
End If
If minuten = 28 Then
Form1.Shape16m.FillStyle = 0
Form1.Shape8m.FillStyle = 0
Form1.Shape4m.FillStyle = 0
End If
If minuten = 29 Then
Form1.Shape16m.FillStyle = 0
Form1.Shape8m.FillStyle = 0
Form1.Shape4m.FillStyle = 0
Form1.Shape1m.FillStyle = 0
End If
If minuten = 30 Then
Form1.Shape16m.FillStyle = 0
Form1.Shape8m.FillStyle = 0
Form1.Shape4m.FillStyle = 0
Form1.Shape2m.FillStyle = 0
End If
If minuten = 31 Then
Form1.Shape16m.FillStyle = 0
Form1.Shape8m.FillStyle = 0
Form1.Shape4m.FillStyle = 0
Form1.Shape2m.FillStyle = 0
Form1.Shape1m.FillStyle = 0
End If
If minuten = 32 Then
Form1.Shape32m.FillStyle = 0
End If
If minuten = 33 Then
Form1.Shape32m.FillStyle = 0
Form1.Shape1m.FillStyle = 0
End If
If minuten = 34 Then
Form1.Shape32m.FillStyle = 0
Form1.Shape2m.FillStyle = 0
End If
If minuten = 35 Then
Form1.Shape32m.FillStyle = 0
Form1.Shape2m.FillStyle = 0
Form1.Shape1m.FillStyle = 0
End If
If minuten = 36 Then
Form1.Shape32m.FillStyle = 0
Form1.Shape4m.FillStyle = 0
End If
If minuten = 37 Then
Form1.Shape32m.FillStyle = 0
Form1.Shape4m.FillStyle = 0
Form1.Shape1m.FillStyle = 0
End If
If minuten = 38 Then
Form1.Shape32m.FillStyle = 0
Form1.Shape4m.FillStyle = 0
Form1.Shape2m.FillStyle = 0
End If
If minuten = 39 Then
Form1.Shape32m.FillStyle = 0
Form1.Shape4m.FillStyle = 0
Form1.Shape2m.FillStyle = 0
Form1.Shape1m.FillStyle = 0
End If
If minuten = 40 Then
Form1.Shape32m.FillStyle = 0
Form1.Shape8m.FillStyle = 0
End If
If minuten = 41 Then
Form1.Shape32m.FillStyle = 0
Form1.Shape8m.FillStyle = 0
Form1.Shape1m.FillStyle = 0
End If
If minuten = 42 Then
Form1.Shape32m.FillStyle = 0
Form1.Shape8m.FillStyle = 0
Form1.Shape2m.FillStyle = 0
End If
If minuten = 43 Then
Form1.Shape32m.FillStyle = 0
Form1.Shape8m.FillStyle = 0
Form1.Shape2m.FillStyle = 0
Form1.Shape1m.FillStyle = 0
End If
If minuten = 44 Then
Form1.Shape32m.FillStyle = 0
Form1.Shape8m.FillStyle = 0
Form1.Shape4m.FillStyle = 0
End If
If minuten = 45 Then
Form1.Shape32m.FillStyle = 0
Form1.Shape8m.FillStyle = 0
Form1.Shape4m.FillStyle = 0
Form1.Shape1m.FillStyle = 0
End If
If minuten = 46 Then
Form1.Shape32m.FillStyle = 0
Form1.Shape8m.FillStyle = 0
Form1.Shape4m.FillStyle = 0
Form1.Shape2m.FillStyle = 0
End If
If minuten = 47 Then
Form1.Shape32m.FillStyle = 0
Form1.Shape8m.FillStyle = 0
Form1.Shape4m.FillStyle = 0
Form1.Shape2m.FillStyle = 0
Form1.Shape1m.FillStyle = 0
End If
If minuten = 48 Then
Form1.Shape32m.FillStyle = 0
Form1.Shape16m.FillStyle = 0
End If
If minuten = 49 Then
Form1.Shape32m.FillStyle = 0
Form1.Shape16m.FillStyle = 0
Form1.Shape1m.FillStyle = 0
End If
If minuten = 50 Then
Form1.Shape32m.FillStyle = 0
Form1.Shape16m.FillStyle = 0
Form1.Shape2m.FillStyle = 0
End If
If minuten = 51 Then
Form1.Shape32m.FillStyle = 0
Form1.Shape16m.FillStyle = 0
Form1.Shape2m.FillStyle = 0
Form1.Shape1m.FillStyle = 0
End If
If minuten = 52 Then
Form1.Shape32m.FillStyle = 0
Form1.Shape16m.FillStyle = 0
Form1.Shape4m.FillStyle = 0
End If
If minuten = 53 Then
Form1.Shape32m.FillStyle = 0
Form1.Shape16m.FillStyle = 0
Form1.Shape4m.FillStyle = 0
Form1.Shape1m.FillStyle = 0
End If
If minuten = 54 Then
Form1.Shape32m.FillStyle = 0
Form1.Shape16m.FillStyle = 0
Form1.Shape4m.FillStyle = 0
Form1.Shape2m.FillStyle = 0
End If
If minuten = 55 Then
Form1.Shape32m.FillStyle = 0
Form1.Shape16m.FillStyle = 0
Form1.Shape4m.FillStyle = 0
Form1.Shape2m.FillStyle = 0
Form1.Shape1m.FillStyle = 0
End If
If minuten = 56 Then
Form1.Shape32m.FillStyle = 0
Form1.Shape16m.FillStyle = 0
Form1.Shape8m.FillStyle = 0
End If
If minuten = 57 Then
Form1.Shape32m.FillStyle = 0
Form1.Shape16m.FillStyle = 0
Form1.Shape8m.FillStyle = 0
Form1.Shape1m.FillStyle = 0
End If
If minuten = 58 Then
Form1.Shape32m.FillStyle = 0
Form1.Shape16m.FillStyle = 0
Form1.Shape8m.FillStyle = 0
Form1.Shape2m.FillStyle = 0
End If
If minuten = 59 Then
Form1.Shape32m.FillStyle = 0
Form1.Shape16m.FillStyle = 0
Form1.Shape8m.FillStyle = 0
Form1.Shape2m.FillStyle = 0
Form1.Shape1m.FillStyle = 0
End If
If minuten = 60 Then
'0 Minuten =)
End If

End Sub
Private Sub sekunde()
If sekunden = 1 Then
Form1.Shape1s.FillStyle = 0
End If
If sekunden = 2 Then
Form1.Shape2s.FillStyle = 0
End If
If sekunden = 3 Then
Form1.Shape2s.FillStyle = 0
Form1.Shape1s.FillStyle = 0
End If
If sekunden = 4 Then
Form1.Shape4s.FillStyle = 0
End If
If sekunden = 5 Then
Form1.Shape4s.FillStyle = 0
Form1.Shape1s.FillStyle = 0
End If
If sekunden = 6 Then
Form1.Shape4s.FillStyle = 0
Form1.Shape2s.FillStyle = 0
End If
If sekunden = 7 Then
Form1.Shape4s.FillStyle = 0
Form1.Shape2s.FillStyle = 0
Form1.Shape1s.FillStyle = 0
End If
If sekunden = 8 Then
Form1.Shape8s.FillStyle = 0
End If
If sekunden = 9 Then
Form1.Shape8s.FillStyle = 0
Form1.Shape1s.FillStyle = 0
End If
If sekunden = 10 Then
Form1.Shape8s.FillStyle = 0
Form1.Shape2s.FillStyle = 0
End If
If sekunden = 11 Then
Form1.Shape8s.FillStyle = 0
Form1.Shape2s.FillStyle = 0
Form1.Shape1s.FillStyle = 0
End If
If sekunden = 12 Then
Form1.Shape8s.FillStyle = 0
Form1.Shape4s.FillStyle = 0
End If
If sekunden = 13 Then
Form1.Shape8s.FillStyle = 0
Form1.Shape4s.FillStyle = 0
Form1.Shape1s.FillStyle = 0
End If
If sekunden = 14 Then
Form1.Shape8s.FillStyle = 0
Form1.Shape4s.FillStyle = 0
Form1.Shape2s.FillStyle = 0
End If
If sekunden = 15 Then
Form1.Shape8s.FillStyle = 0
Form1.Shape4s.FillStyle = 0
Form1.Shape2s.FillStyle = 0
Form1.Shape1s.FillStyle = 0
End If
If sekunden = 16 Then
Form1.Shape16s.FillStyle = 0
End If
If sekunden = 17 Then
Form1.Shape16s.FillStyle = 0
Form1.Shape1s.FillStyle = 0
End If
If sekunden = 18 Then
Form1.Shape16s.FillStyle = 0
Form1.Shape2s.FillStyle = 0
End If
If sekunden = 19 Then
Form1.Shape16s.FillStyle = 0
Form1.Shape2s.FillStyle = 0
Form1.Shape1s.FillStyle = 0
End If
If sekunden = 20 Then
Form1.Shape16s.FillStyle = 0
Form1.Shape4s.FillStyle = 0
End If
If sekunden = 21 Then
Form1.Shape16s.FillStyle = 0
Form1.Shape4s.FillStyle = 0
Form1.Shape1s.FillStyle = 0
End If
If sekunden = 22 Then
Form1.Shape16s.FillStyle = 0
Form1.Shape4s.FillStyle = 0
Form1.Shape2s.FillStyle = 0
End If
If sekunden = 23 Then
Form1.Shape16s.FillStyle = 0
Form1.Shape4s.FillStyle = 0
Form1.Shape2s.FillStyle = 0
Form1.Shape1s.FillStyle = 0
End If
If sekunden = 24 Then
Form1.Shape16s.FillStyle = 0
Form1.Shape8s.FillStyle = 0
End If
If sekunden = 25 Then
Form1.Shape16s.FillStyle = 0
Form1.Shape8s.FillStyle = 0
Form1.Shape1s.FillStyle = 0
End If
If sekunden = 26 Then
Form1.Shape16s.FillStyle = 0
Form1.Shape8s.FillStyle = 0
Form1.Shape2s.FillStyle = 0
End If
If sekunden = 27 Then
Form1.Shape16s.FillStyle = 0
Form1.Shape8s.FillStyle = 0
Form1.Shape2s.FillStyle = 0
Form1.Shape1s.FillStyle = 0
End If
If sekunden = 28 Then
Form1.Shape16s.FillStyle = 0
Form1.Shape8s.FillStyle = 0
Form1.Shape4s.FillStyle = 0
End If
If sekunden = 29 Then
Form1.Shape16s.FillStyle = 0
Form1.Shape8s.FillStyle = 0
Form1.Shape4s.FillStyle = 0
Form1.Shape1s.FillStyle = 0
End If
If sekunden = 30 Then
Form1.Shape16s.FillStyle = 0
Form1.Shape8s.FillStyle = 0
Form1.Shape4s.FillStyle = 0
Form1.Shape2s.FillStyle = 0
End If
If sekunden = 31 Then
Form1.Shape16s.FillStyle = 0
Form1.Shape8s.FillStyle = 0
Form1.Shape4s.FillStyle = 0
Form1.Shape2s.FillStyle = 0
Form1.Shape1s.FillStyle = 0
End If
If sekunden = 32 Then
Form1.Shape32s.FillStyle = 0
End If
If sekunden = 33 Then
Form1.Shape32s.FillStyle = 0
Form1.Shape1s.FillStyle = 0
End If
If sekunden = 34 Then
Form1.Shape32s.FillStyle = 0
Form1.Shape2s.FillStyle = 0
End If
If sekunden = 35 Then
Form1.Shape32s.FillStyle = 0
Form1.Shape2s.FillStyle = 0
Form1.Shape1s.FillStyle = 0
End If
If sekunden = 36 Then
Form1.Shape32s.FillStyle = 0
Form1.Shape4s.FillStyle = 0
End If
If sekunden = 37 Then
Form1.Shape32s.FillStyle = 0
Form1.Shape4s.FillStyle = 0
Form1.Shape1s.FillStyle = 0
End If
If sekunden = 38 Then
Form1.Shape32s.FillStyle = 0
Form1.Shape4s.FillStyle = 0
Form1.Shape2s.FillStyle = 0
End If
If sekunden = 39 Then
Form1.Shape32s.FillStyle = 0
Form1.Shape4s.FillStyle = 0
Form1.Shape2s.FillStyle = 0
Form1.Shape1s.FillStyle = 0
End If
If sekunden = 40 Then
Form1.Shape32s.FillStyle = 0
Form1.Shape8s.FillStyle = 0
End If
If sekunden = 41 Then
Form1.Shape32s.FillStyle = 0
Form1.Shape8s.FillStyle = 0
Form1.Shape1s.FillStyle = 0
End If
If sekunden = 42 Then
Form1.Shape32s.FillStyle = 0
Form1.Shape8s.FillStyle = 0
Form1.Shape2s.FillStyle = 0
End If
If sekunden = 43 Then
Form1.Shape32s.FillStyle = 0
Form1.Shape8s.FillStyle = 0
Form1.Shape2s.FillStyle = 0
Form1.Shape1s.FillStyle = 0
End If
If sekunden = 44 Then
Form1.Shape32s.FillStyle = 0
Form1.Shape8s.FillStyle = 0
Form1.Shape4s.FillStyle = 0
End If
If sekunden = 45 Then
Form1.Shape32s.FillStyle = 0
Form1.Shape8s.FillStyle = 0
Form1.Shape4s.FillStyle = 0
Form1.Shape1s.FillStyle = 0
End If
If sekunden = 46 Then
Form1.Shape32s.FillStyle = 0
Form1.Shape8s.FillStyle = 0
Form1.Shape4s.FillStyle = 0
Form1.Shape2s.FillStyle = 0
End If
If sekunden = 47 Then
Form1.Shape32s.FillStyle = 0
Form1.Shape8s.FillStyle = 0
Form1.Shape4s.FillStyle = 0
Form1.Shape2s.FillStyle = 0
Form1.Shape1s.FillStyle = 0
End If
If sekunden = 48 Then
Form1.Shape32s.FillStyle = 0
Form1.Shape16s.FillStyle = 0
End If
If sekunden = 49 Then
Form1.Shape32s.FillStyle = 0
Form1.Shape16s.FillStyle = 0
Form1.Shape1s.FillStyle = 0
End If
If sekunden = 50 Then
Form1.Shape32s.FillStyle = 0
Form1.Shape16s.FillStyle = 0
Form1.Shape2s.FillStyle = 0
End If
If sekunden = 51 Then
Form1.Shape32s.FillStyle = 0
Form1.Shape16s.FillStyle = 0
Form1.Shape2s.FillStyle = 0
Form1.Shape1s.FillStyle = 0
End If
If sekunden = 52 Then
Form1.Shape32s.FillStyle = 0
Form1.Shape16s.FillStyle = 0
Form1.Shape4s.FillStyle = 0
End If
If sekunden = 53 Then
Form1.Shape32s.FillStyle = 0
Form1.Shape16s.FillStyle = 0
Form1.Shape4s.FillStyle = 0
Form1.Shape1s.FillStyle = 0
End If
If sekunden = 54 Then
Form1.Shape32s.FillStyle = 0
Form1.Shape16s.FillStyle = 0
Form1.Shape4s.FillStyle = 0
Form1.Shape2s.FillStyle = 0
End If
If sekunden = 55 Then
Form1.Shape32s.FillStyle = 0
Form1.Shape16s.FillStyle = 0
Form1.Shape4s.FillStyle = 0
Form1.Shape2s.FillStyle = 0
Form1.Shape1s.FillStyle = 0
End If
If sekunden = 56 Then
Form1.Shape32s.FillStyle = 0
Form1.Shape16s.FillStyle = 0
Form1.Shape8s.FillStyle = 0
End If
If sekunden = 57 Then
Form1.Shape32s.FillStyle = 0
Form1.Shape16s.FillStyle = 0
Form1.Shape8s.FillStyle = 0
Form1.Shape1s.FillStyle = 0
End If
If sekunden = 58 Then
Form1.Shape32s.FillStyle = 0
Form1.Shape16s.FillStyle = 0
Form1.Shape8s.FillStyle = 0
Form1.Shape2s.FillStyle = 0
End If
If sekunden = 59 Then
Form1.Shape32s.FillStyle = 0
Form1.Shape16s.FillStyle = 0
Form1.Shape8s.FillStyle = 0
Form1.Shape2s.FillStyle = 0
Form1.Shape1s.FillStyle = 0
End If
End Sub
'-----------------------------------------INS BIN�RE =) ENDE

Private Sub Picture1_Click()
      For i = 1 To 20
        MsgBox "LOL", OkOnly, "lol"
      Next i
End Sub
Private Sub Com2_Click()
Call UnloadForms
End Sub

Private Sub sos_Click()
frmSplash.Show
End Sub

Private Sub Timer1_Timer()
If Second(Now) Mod 2 = 0 Then
Else
End If
Call TIMETIMETIME
Call stunde
Call minute
Call sekunde
End Sub

Private Sub about_Click()
frmAbout.Show
End Sub
'-----------------------------------------------------
