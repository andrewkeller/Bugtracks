#tag Window
Begin ContainerControl ctrViewCase Implements MainWindowView
   AcceptFocus     =   ""
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   16777215
   Backdrop        =   ""
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   275
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
   Width           =   350
   Begin Label lblCreator
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   44
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   20
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   0
      TabPanelIndex   =   0
      Text            =   "Creator:\rSomeone"
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   14
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   150
   End
   Begin Label lblStatus
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   44
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   20
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   6
      TabPanelIndex   =   0
      Text            =   "Status:\rIn Progress"
      TextAlign       =   0
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   70
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   150
   End
   Begin TextArea txtDesc
      AcceptTabs      =   ""
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   16777215
      Bold            =   ""
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   241
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   ""
      Left            =   182
      LimitText       =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Multiline       =   True
      ReadOnly        =   True
      Scope           =   0
      ScrollbarHorizontal=   ""
      ScrollbarVertical=   True
      Styled          =   True
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   14
      Underline       =   ""
      UseFocusRing    =   False
      Visible         =   True
      Width           =   148
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
		Sub Constructor(c As BTCase)
		  // Created 4/15/2011 by Andrew Keller
		  
		  // Initializes this class.
		  
		  p_case = c
		  
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
		  // Created 4/23/2011 by Andrew Keller
		  
		  // Update the displayed data.
		  
		  If p_case Is Nil Then
		    
		    lblCreator.Text = ""
		    lblStatus.Text = ""
		    txtDesc.Text = "The given case object is Nil.  Can't do very much here."
		    
		  Else
		    
		    lblCreator.Text = "Creator:" + EndOfLine + Str( p_case.Creator )
		    lblStatus.Text = "Status:" + EndOfLine + p_case.Status
		    txtDesc.StyledText = p_case.StyledBody
		    
		  End If
		  
		  // done.
		  
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
		Protected p_case As BTCase
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected p_eh As ViewEventHookMethod
	#tag EndProperty


#tag EndWindowCode

