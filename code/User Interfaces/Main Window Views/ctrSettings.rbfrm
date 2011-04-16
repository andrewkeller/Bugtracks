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
   Height          =   1.46e+2
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
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected p_repo As BTRepo
	#tag EndProperty


#tag EndWindowCode

