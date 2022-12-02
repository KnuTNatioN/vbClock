VERSION 5.00
Begin VB.Form frmAbout 
   BorderStyle     =   3  'Fester Dialog
   Caption         =   "ueber Binaer Uhr"
   ClientHeight    =   2655
   ClientLeft      =   2580
   ClientTop       =   1950
   ClientWidth     =   5175
   ClipControls    =   0   'False
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1832.528
   ScaleMode       =   0  'Benutzerdefiniert
   ScaleWidth      =   4859.592
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'Fenstermitte
   Begin VB.PictureBox picIcon 
      AutoSize        =   -1  'True
      ClipControls    =   0   'False
      Height          =   540
      Left            =   240
      Picture         =   "frmAbout.frx":0000
      ScaleHeight     =   337.12
      ScaleMode       =   0  'Benutzerdefiniert
      ScaleWidth      =   337.12
      TabIndex        =   1
      Top             =   120
      Width           =   540
   End
   Begin VB.CommandButton cmdOK 
      Cancel          =   -1  'True
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   345
      Left            =   3720
      TabIndex        =   0
      Top             =   2160
      Width           =   1260
   End
   Begin VB.Label lblDescription 
      Caption         =   "Beschreibung"
      ForeColor       =   &H00000000&
      Height          =   1170
      Left            =   1080
      TabIndex        =   2
      Top             =   960
      Width           =   3885
   End
   Begin VB.Label lblTitle 
      Caption         =   "Name der Anwendung"
      ForeColor       =   &H00000000&
      Height          =   360
      Left            =   1080
      TabIndex        =   3
      Top             =   120
      Width           =   3885
   End
   Begin VB.Label lblVersion 
      Caption         =   "Version"
      Height          =   225
      Left            =   1050
      TabIndex        =   4
      Top             =   600
      Width           =   3885
   End
End
Attribute VB_Name = "frmAbout"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdOK_Click()
Unload Me
End Sub

Private Sub Form_Load()
lblTitle.Caption = "Binaer Uhr"
lblVersion.Caption = "v.1.01"
lblDescription.Caption = " bei Fragen oder Vorschlaegen, hier ins Git..."
End Sub

Private Sub lblDescription_Click()
Clipboard.Clear
Clipboard.SetText "sorry, keine mail."
MsgBox "info@stiev-o.de wurde in die Zwischenablage Kopiert", vbOKOnly, "Zwischenablage- Email"
End Sub
