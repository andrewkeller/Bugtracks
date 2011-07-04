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
   Height          =   348
   HelpTag         =   ""
   InitialParent   =   ""
   Left            =   32
   LockBottom      =   True
   LockLeft        =   True
   LockRight       =   True
   LockTop         =   True
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Top             =   32
   UseFocusRing    =   ""
   Visible         =   False
   Width           =   438
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
      PanelCount      =   4
      Panels          =   ""
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      Top             =   46
      Value           =   2
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
         TabPanelIndex   =   3
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
      Begin PushButton PushButton2
         AutoDeactivate  =   True
         Bold            =   ""
         ButtonStyle     =   0
         Cancel          =   ""
         Caption         =   "Open a different folder"
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
         TabIndex        =   2
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   107
         Underline       =   ""
         Visible         =   True
         Width           =   193
      End
      Begin PushButton PushButton3
         AutoDeactivate  =   True
         Bold            =   ""
         ButtonStyle     =   0
         Cancel          =   ""
         Caption         =   "Open..."
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
         TabIndex        =   0
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   171
         Underline       =   ""
         Visible         =   True
         Width           =   132
      End
      Begin PushButton PushButton4
         AutoDeactivate  =   True
         Bold            =   ""
         ButtonStyle     =   0
         Cancel          =   ""
         Caption         =   "Save As..."
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
         Top             =   107
         Underline       =   ""
         Visible         =   True
         Width           =   132
      End
      Begin Label Label3
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
         TabIndex        =   2
         TabPanelIndex   =   2
         Text            =   "This Bugtracks data pool is currently completely in memory."
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
      Begin Label Label4
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
         TabPanelIndex   =   4
         Text            =   "There are currently no settings at this level."
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
      Begin PushButton PushButton5
         AutoDeactivate  =   True
         Bold            =   ""
         ButtonStyle     =   0
         Cancel          =   ""
         Caption         =   "Overwrite what's there to make it valid"
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
         TabIndex        =   3
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   171
         Underline       =   ""
         Visible         =   True
         Width           =   286
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
		Sub EmbedWithin1(containingWindow As Window, left As Integer = 0, top As Integer = 0, width As Integer = - 1, height As Integer = - 1)
		  // Created 4/15/2011 by Andrew Keller
		  
		  // Part of the MainWindowView interface.
		  
		  EmbedWithin containingWindow, left, top, width, height
		  
		  // done.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EventHook() As ViewEventHookMethod
		  // Created 4/23/2011 by Andrew Keller
		  
		  // Returns the current event hook.
		  
		  Return p_eh
		  
		  // done.
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EventHook(Assigns newHook As ViewEventHookMethod)
		  // Created 4/23/2011 by Andrew Keller
		  
		  // Sets the event hook.
		  
		  p_eh = newHook
		  
		  // done.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReportEvent(event_id As String)
		  // Created 4/23/2011 by Andrew Keller
		  
		  // Invokes the event hook with the given parameter.
		  
		  If Not ( p_eh Is Nil ) Then
		    
		    p_eh.Invoke Me, event_id
		    
		  End If
		  
		  // done.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Update()
		  // Created 4/15/2011 by Andrew Keller
		  
		  // Updates this window based on the current state of the repository.
		  
		  // Set the heading:
		  
		  If p_repo Is Nil Then
		    lblHead.Caption = "Repository-Specific Settings"
		    
		  ElseIf p_repo.DataSourceSummary = p_repo.kDataSourceMemory Then
		    lblHead.Caption = "Repository-Specific Settings (not saved yet!)"
		    
		  Else
		    lblHead.Caption = "Repository-Specific Settings for " + p_repo.DataSourceSummary
		    
		  End If
		  
		  
		  // Set the body:
		  
		  If p_repo Is Nil Then
		    
		    pgpMain.Value = 0
		    
		  ElseIf p_repo.DataSourceSummary = p_repo.kDataSourceMemory Then
		    
		    pgpMain.Value = 1
		    
		  ElseIf p_repo.ProblemAccessingRepository Then
		    
		    pgpMain.Value = 2
		    
		  Else
		    
		    pgpMain.Value = 3
		    
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Visible1() As Boolean
		  // Created 4/15/2011 by Andrew Keller
		  
		  // Part of the MainWindowView interface.
		  
		  Return Me.Visible
		  
		  // done.
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Visible1(Assigns newValue As Boolean)
		  // Created 4/15/2011 by Andrew Keller
		  
		  // Part of the MainWindowView interface.
		  
		  Me.Visible = newValue
		  
		  // done.
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected p_eh As ViewEventHookMethod
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected p_repo As BTRepo
	#tag EndProperty


#tag EndWindowCode

#tag Events PushButton2
	#tag Event
		Sub Action()
		  // Created 7/1/2011 by Andrew Keller
		  
		  // Instructs the repository object to open a new repository.
		  
		  MsgBox "Eeek!  I don't know what to do!" + EndOfLine + EndOfLine + "Note to self: This code needs to get written."
		  
		  // done.
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton3
	#tag Event
		Sub Action()
		  // Created 7/1/2011 by Andrew Keller
		  
		  // Instructs the repository object to open a new repository.
		  
		  MsgBox "Eeek!  I don't know what to do!" + EndOfLine + EndOfLine + "Note to self: This code needs to get written."
		  
		  // done.
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton4
	#tag Event
		Sub Action()
		  // Created 4/15/2011 by Andrew Keller
		  
		  // Instructs the repository object to initialize the folder.
		  
		  MsgBox "Eeek!  I don't know what to do!" + EndOfLine + EndOfLine + "Note to self: This code needs to get written."
		  
		  // done.
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton5
	#tag Event
		Sub Action()
		  // Created 7/1/2011 by Andrew Keller
		  
		  // Instructs the repository object to open a new repository.
		  
		  MsgBox "Eeek!  I don't know what to do!" + EndOfLine + EndOfLine + "Note to self: This code needs to get written."
		  
		  // done.
		  
		End Sub
	#tag EndEvent
#tag EndEvents
