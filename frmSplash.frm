VERSION 5.00
Begin VB.Form frmSplash 
   Appearance      =   0  '2D
   BackColor       =   &H80000005&
   BorderStyle     =   3  'Fester Dialog
   ClientHeight    =   2820
   ClientLeft      =   255
   ClientTop       =   1410
   ClientWidth     =   7215
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   Icon            =   "frmSplash.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2820
   ScaleWidth      =   7215
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'Bildschirmmitte
   Begin VB.CommandButton Command3 
      Caption         =   "Uhr schliessen"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   5160
      TabIndex        =   5
      Top             =   2280
      Width           =   1935
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Hilfe Beenden"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   1680
      TabIndex        =   4
      Top             =   2280
      Width           =   3375
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Email Zwischenablage"
      Height          =   495
      Left            =   120
      TabIndex        =   3
      ToolTipText     =   "Email Addresse in die Zwischenablage kopieren"
      Top             =   2280
      Width           =   1335
   End
   Begin VB.PictureBox Picture1 
      AutoSize        =   -1  'True
      BorderStyle     =   0  'Kein
      Height          =   2190
      Left            =   1560
      Picture         =   "frmSplash.frx":000C
      ScaleHeight     =   2190
      ScaleWidth      =   5565
      TabIndex        =   1
      Top             =   0
      Width           =   5565
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "Bei anderen Fragen, Email an: info@stiev-o.de"
      Height          =   1095
      Left            =   120
      TabIndex        =   2
      Top             =   1560
      Width           =   1575
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Zentriert
      BackStyle       =   0  'Transparent
      Caption         =   "Hilfe:"
      BeginProperty Font 
         Name            =   "Comic Sans MS"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   1455
   End
End
Attribute VB_Name = "frmSplash"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Sub Command1_Click()
'Zwischenablage Koperen
Clipboard.Clear
Clipboard.SetText "info@stiev-o.de"
MsgBox "info@stiev-o.de wurde in die Zwischenablage Kopiert", vbOKOnly, "Zwischenablage- Email"
If MsgBox(" Moechten Sie nun die Hilfe Schliessen?", vbYesNo, "Hilfe Beenden?") = vbYes Then
frmSplash.Hide
End If
End Sub
Private Sub Command2_Click()
If MsgBox(" Moechten Sie die Hilfe Schliessen?", vbYesNo, "Hilfe Beenden?") = vbYes Then
frmSplash.Hide
End If
End Sub

Private Sub Command3_Click()
Call Form1.UnloadForms
End Sub
