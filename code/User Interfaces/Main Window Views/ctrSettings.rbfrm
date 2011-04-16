#tag Window
Begin ContainerControl ctrSettings Implements MainWindowView
   AcceptFocus     =   ""
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   3.48e+2
   HelpTag         =   ""
   InitialParent   =   ""
   Left            =   3.2e+1
   LockBottom      =   True
   LockLeft        =   True
   LockRight       =   True
   LockTop         =   True
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Top             =   3.2e+1
   UseFocusRing    =   ""
   Visible         =   True
   Width           =   4.38e+2
   Begin Label lblHead
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   20
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   0
      TabPanelIndex   =   0
      Text            =   "Repository-Specific Settings for /some/path"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   14
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   398
   End
   Begin PagePanel pgpMain
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   302
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      PanelCount      =   3
      Panels          =   ""
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      Top             =   46
      Value           =   1
      Visible         =   True
      Width           =   438
      Begin Label Label1
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "pgpMain"
         Italic          =   ""
         Left            =   20
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   ""
         Scope           =   0
         Selectable      =   False
         TabIndex        =   0
         TabPanelIndex   =   2
         Text            =   "This folder does not appear to be a valid Bugtracks data pool."
         TextAlign       =   0
         TextColor       =   &h000000
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   58
         Transparent     =   False
         Underline       =   ""
         Visible         =   True
         Width           =   418
      End
      Begin PushButton PushButton1
         AutoDeactivate  =   True
         Bold            =   ""
         ButtonStyle     =   0
         Cancel          =   ""
         Caption         =   "Make this folder a valid Bugtracks data pool"
         Default         =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "pgpMain"
         Italic          =   ""
         Left            =   20
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   90
         Underline       =   ""
         Visible         =   True
         Width           =   334
      End
      Begin Label Label2
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   270
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "pgpMain"
         Italic          =   ""
         Left            =   20
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   True
         Scope           =   0
         Selectable      =   False
         TabIndex        =   0
         TabPanelIndex   =   1
         Text            =   "For some reason, the repository object that this window received to display is Nil.\r\rNot much can be done in this state."
         TextAlign       =   0
         TextColor       =   &h000000
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   58
         Transparent     =   False
         Underline       =   ""
         Visible         =   True
         Width           =   398
      End
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub Constructor()
		  // Created 4/15/2011 by Andrew Keller
		  
		  // Initializes this class.
		  
		  Super.Constructor
		  
		  Update
		  
		  // done.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(r As BTRepo)
		  // Created 4/15/2011 by Andrew Keller
		  
		  // Initializes this class.
		  
		  p_repo = r
		  
		  Constructor
		  
		  // done.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub c_EmbedWithin(containingWindow As Window, left As Integer=0, top As Integer=0, width As Integer=-1, height As Integer=-1)
		  // Created 4/15/2011 by Andrew Keller
		  
		  // Part of the MainWindowView interface.
		  
		  Me.EmbedWithin containingWindow, left, top, width, height
		  
		  // done.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function c_Visible() As Boolean
		  // Created 4/15/2011 by Andrew Keller
		  
		  // Part of the MainWindowView interface.
		  
		  Return Me.Visible
		  
		  // done.
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub c_Visible(Assigns newValue As Boolean)
		  // Created 4/15/2011 by Andrew Keller
		  
		  // Part of the MainWindowView interface.
		  
		  Me.Visible = newValue
		  
		  // done.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Update()
		  // Created 4/15/2011 by Andrew Keller
		  
		  // Updates this window based on the current state of the repository.
		  
		  If p_repo Is Nil Then
		    
		    pgpMain.Value = 0
		    
		  ElseIf Not p_repo.RepoFolderInitialized Then
		    
		    pgpMain.Value = 1
		    
		  Else
		    
		    pgpMain.Value = 2
		    
		  End If
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected p_repo As BTRepo
	#tag EndProperty


#tag EndWindowCode

#tag Events PushButton1
	#tag Event
		Sub Action()
		  // Created 4/15/2011 by Andrew Keller
		  
		  // Instructs the repository object to initialize the folder.
		  
		  If p_repo Is Nil Then
		    
		    MsgBox "Okay, the repository object is Nil.  You weren't supposed to be able to click that button."
		    
		  Else
		    
		    p_repo.InitializeRepoFolder
		    
		    Update
		    
		  End If
		  
		  // done.
		  
		End Sub
	#tag EndEvent
#tag EndEvents
