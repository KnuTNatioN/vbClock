VERSION 5.00
Begin VB.Form Form2 
   BorderStyle     =   4  'Festes Werkzeugfenster
   Caption         =   "Uhr Einstellungen"
   ClientHeight    =   2550
   ClientLeft      =   7560
   ClientTop       =   6180
   ClientWidth     =   4590
   ControlBox      =   0   'False
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2550
   ScaleWidth      =   4590
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'Fenstermitte
   Begin VB.CommandButton Command4 
      Caption         =   "OK"
      Height          =   375
      Left            =   3120
      TabIndex        =   6
      Top             =   1920
      Width           =   1335
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Digitale Uhr AN"
      Height          =   495
      Left            =   3120
      TabIndex        =   5
      Top             =   360
      Width           =   1335
   End
   Begin VB.Frame Frame1 
      Caption         =   "Zeichen Einstellungen"
      Height          =   2055
      Left            =   240
      TabIndex        =   0
      Top             =   240
      Width           =   2775
      Begin VB.CommandButton Commandrundquadrat 
         Caption         =   "Rundes Quadrat"
         Height          =   495
         Left            =   600
         TabIndex        =   4
         Top             =   1440
         Width           =   975
      End
      Begin VB.CommandButton CommandKreis 
         Caption         =   "Kreis"
         Height          =   495
         Left            =   600
         TabIndex        =   3
         Top             =   840
         Width           =   975
      End
      Begin VB.CommandButton CommandQuadrat 
         Caption         =   "Quadrat"
         Height          =   495
         Left            =   600
         TabIndex        =   2
         Top             =   240
         Width           =   975
      End
      Begin VB.Frame Frame2 
         Caption         =   "Aktuell"
         Height          =   975
         Left            =   1800
         TabIndex        =   1
         Top             =   240
         Width           =   855
         Begin VB.Shape Shape1 
            Height          =   375
            Left            =   240
            Shape           =   1  'Quadrat
            Top             =   360
            Width           =   375
         End
      End
      Begin VB.Shape Shape4 
         Height          =   375
         Left            =   120
         Shape           =   5  'Gerundetes Quadrat
         Top             =   1440
         Width           =   375
      End
      Begin VB.Shape Shape3 
         Height          =   375
         Left            =   120
         Shape           =   3  'Kreis
         Top             =   840
         Width           =   375
      End
      Begin VB.Shape Shape2 
         Height          =   375
         Left            =   120
         Shape           =   1  'Quadrat
         Top             =   240
         Width           =   375
      End
   End
End
Attribute VB_Name = "Form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Sub Command1_Click()
If Form1.Text1.Visible = True Then
Form1.Text1.Visible = False
Command1.Caption = "Digital- Uhr AN"
Else
Form1.Text1.Visible = True
Command1.Caption = "Digital- Uhr AUS"
End If
End Sub

Private Sub Command4_Click()
Unload Me
End Sub

Sub Commandrundquadrat_Click()
Shape1.Shape = 5
'Shape1
Form1.Shape1.Shape = 5
Form1.Shape1.FillStyle = 1
Form1.Shape1.FillColor = &HFF00&
'----Shape Ende----'
'Shape2
Form1.Shape2.Shape = 5
Form1.Shape2.FillStyle = 1
Form1.Shape2.FillColor = &HFF00&
'----Shape Ende----'
'Shape3
Form1.Shape4.Shape = 5
Form1.Shape4.FillStyle = 1
Form1.Shape4.FillColor = &HFF00&
'----Shape Ende----'
'Shape4
Form1.Shape8.Shape = 5
Form1.Shape8.FillStyle = 1
Form1.Shape8.FillColor = &HFF00&
'----Shape Ende----'
'Shape5
Form1.Shape32m.Shape = 5
Form1.Shape32m.FillStyle = 1
Form1.Shape32m.FillColor = &HFF00&
'----Shape Ende----'
'Shape6
Form1.Shape16m.Shape = 5
Form1.Shape16m.FillStyle = 1
Form1.Shape16m.FillColor = &HFF00&
'----Shape Ende----'
'Shape7
Form1.Shape8m.Shape = 5
Form1.Shape8m.FillStyle = 1
Form1.Shape8m.FillColor = &HFF00&
'----Shape Ende----'
'Shape
Form1.Shape4m.Shape = 5
Form1.Shape4m.FillStyle = 1
Form1.Shape4m.FillColor = &HFF00&
'----Shape Ende----'
'Shape9
Form1.Shape2m.Shape = 5
Form1.Shape2m.FillStyle = 1
Form1.Shape2m.FillColor = &HFF00&
'----Shape Ende----'
'Shape10
Form1.Shape1m.Shape = 5
Form1.Shape1m.FillStyle = 1
Form1.Shape1m.FillColor = &HFF00&
'----Shape Ende----'
'-SEKUNDEN---NEXT
Form1.Shape32s.Shape = 5
Form1.Shape32s.FillStyle = 1
Form1.Shape32m.FillColor = &HFF00&
'----NEXT
Form1.Shape16s.Shape = 5
Form1.Shape16s.FillStyle = 1
Form1.Shape16s.FillColor = &HFF00&
'----NEXT
Form1.Shape8s.Shape = 5
Form1.Shape8s.FillStyle = 1
Form1.Shape8s.FillColor = &HFF00&
'----NEXT
Form1.Shape4s.Shape = 5
Form1.Shape4s.FillStyle = 1
Form1.Shape4s.FillColor = &HFF00&
'----NEXT
Form1.Shape2s.Shape = 5
Form1.Shape2s.FillStyle = 1
Form1.Shape2s.FillColor = &HFF00&
'----NEXT
Form1.Shape1s.Shape = 5
Form1.Shape1s.FillStyle = 1
Form1.Shape1s.FillColor = &HFF00&
'----Shape Ende----'
End Sub

Sub CommandKreis_Click()
Shape1.Shape = 3
'Shape1
Form1.Shape1.Shape = 3
Form1.Shape1.FillStyle = 1
Form1.Shape1.FillColor = &HFF00&
'----Shape Ende----'
'Shape2
Form1.Shape2.Shape = 3
Form1.Shape2.FillStyle = 1
Form1.Shape2.FillColor = &HFF00&
'----Shape Ende----'
'Shape3
Form1.Shape4.Shape = 3
Form1.Shape4.FillStyle = 1
Form1.Shape4.FillColor = &HFF00&
'----Shape Ende----'
'Shape4
Form1.Shape8.Shape = 3
Form1.Shape8.FillStyle = 1
Form1.Shape8.FillColor = &HFF00&
'----Shape Ende----'
'Shape5
Form1.Shape32m.Shape = 3
Form1.Shape32m.FillStyle = 1
Form1.Shape32m.FillColor = &HFF00&
'----Shape Ende----'
'Shape6
Form1.Shape16m.Shape = 3
Form1.Shape16m.FillStyle = 1
Form1.Shape16m.FillColor = &HFF00&
'----Shape Ende----'
'Shape7
Form1.Shape8m.Shape = 3
Form1.Shape8m.FillStyle = 1
Form1.Shape8m.FillColor = &HFF00&
'----Shape Ende----'
'Shape
Form1.Shape4m.Shape = 3
Form1.Shape4m.FillStyle = 1
Form1.Shape4m.FillColor = &HFF00&
'----Shape Ende----'
'Shape9
Form1.Shape2m.Shape = 3
Form1.Shape2m.FillStyle = 1
Form1.Shape2m.FillColor = &HFF00&
'----Shape Ende----'
'Shape10
Form1.Shape1m.Shape = 3
Form1.Shape1m.FillStyle = 1
Form1.Shape1m.FillColor = &HFF00&
'----Shape Ende----'
'-SEKUNDEN---NEXT
Form1.Shape32s.Shape = 3
Form1.Shape32s.FillStyle = 1
Form1.Shape32m.FillColor = &HFF00&
'----NEXT
Form1.Shape16s.Shape = 3
Form1.Shape16s.FillStyle = 1
Form1.Shape16s.FillColor = &HFF00&
'----NEXT
Form1.Shape8s.Shape = 3
Form1.Shape8s.FillStyle = 1
Form1.Shape8s.FillColor = &HFF00&
'----NEXT
Form1.Shape4s.Shape = 3
Form1.Shape4s.FillStyle = 1
Form1.Shape4s.FillColor = &HFF00&
'----NEXT
Form1.Shape2s.Shape = 3
Form1.Shape2s.FillStyle = 1
Form1.Shape2s.FillColor = &HFF00&
'----NEXT
Form1.Shape1s.Shape = 3
Form1.Shape1s.FillStyle = 1
Form1.Shape1s.FillColor = &HFF00&
'----Shape Ende----'
End Sub

Sub CommandQuadrat_Click()
Shape1.Shape = 1
'Shape1
Form1.Shape1.Shape = 1
Form1.Shape1.FillStyle = 1
Form1.Shape1.FillColor = &HFF00&
'----Shape Ende----'
'Shape2
Form1.Shape2.Shape = 1
Form1.Shape2.FillStyle = 1
Form1.Shape2.FillColor = &HFF00&
'----Shape Ende----'
'Shape3
Form1.Shape4.Shape = 1
Form1.Shape4.FillStyle = 1
Form1.Shape4.FillColor = &HFF00&
'----Shape Ende----'
'Shape4
Form1.Shape8.Shape = 1
Form1.Shape8.FillStyle = 1
Form1.Shape8.FillColor = &HFF00&
'----Shape Ende----'
'Shape5
Form1.Shape32m.Shape = 1
Form1.Shape32m.FillStyle = 1
Form1.Shape32m.FillColor = &HFF00&
'----Shape Ende----'
'Shape6
Form1.Shape16m.Shape = 1
Form1.Shape16m.FillStyle = 1
Form1.Shape16m.FillColor = &HFF00&
'----Shape Ende----'
'Shape7
Form1.Shape8m.Shape = 1
Form1.Shape8m.FillStyle = 1
Form1.Shape8m.FillColor = &HFF00&
'----Shape Ende----'
'Shape
Form1.Shape4m.Shape = 1
Form1.Shape4m.FillStyle = 1
Form1.Shape4m.FillColor = &HFF00&
'----Shape Ende----'
'Shape9
Form1.Shape2m.Shape = 1
Form1.Shape2m.FillStyle = 1
Form1.Shape2m.FillColor = &HFF00&
'----Shape Ende----'
'Shape10
Form1.Shape1m.Shape = 1
Form1.Shape1m.FillStyle = 1
Form1.Shape1m.FillColor = &HFF00&
'----Shape Ende----'
'-SEKUNDEN---NEXT
Form1.Shape32s.Shape = 5
Form1.Shape32s.FillStyle = 1
Form1.Shape32m.FillColor = &HFF00&
'----NEXT
Form1.Shape16s.Shape = 1
Form1.Shape16s.FillStyle = 1
Form1.Shape16s.FillColor = &HFF00&
'----NEXT
Form1.Shape8s.Shape = 1
Form1.Shape8s.FillStyle = 1
Form1.Shape8s.FillColor = &HFF00&
'----NEXT
Form1.Shape4s.Shape = 1
Form1.Shape4s.FillStyle = 1
Form1.Shape4s.FillColor = &HFF00&
'----NEXT
Form1.Shape2s.Shape = 1
Form1.Shape2s.FillStyle = 1
Form1.Shape2s.FillColor = &HFF00&
'----NEXT
Form1.Shape1s.Shape = 1
Form1.Shape1s.FillStyle = 1
Form1.Shape1s.FillColor = &HFF00&
'----Shape Ende----'
End Sub

Private Sub Form_Load()
Shape1.Shape = 3
End Sub
