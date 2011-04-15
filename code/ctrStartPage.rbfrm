#tag Window
Begin ContainerControl ctrStartPage
   AcceptFocus     =   ""
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   241
   HelpTag         =   ""
   InitialParent   =   ""
   Left            =   3.2e+1
   LockBottom      =   ""
   LockLeft        =   ""
   LockRight       =   ""
   LockTop         =   ""
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Top             =   3.2e+1
   UseFocusRing    =   ""
   Visible         =   True
   Width           =   533
   Begin RoundRectangle msgrect
      AutoDeactivate  =   True
      BorderColor     =   &h000000
      BorderWidth     =   1
      Enabled         =   True
      FillColor       =   &hFFFFFF
      Height          =   175
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   38
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   ""
      LockTop         =   False
      OvalHeight      =   16
      OvalWidth       =   16
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      Top             =   33
      Visible         =   True
      Width           =   457
      Begin Label lblMsg
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   133
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "msgrect"
         Italic          =   ""
         Left            =   59
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   True
         Scope           =   0
         Selectable      =   False
         TabIndex        =   0
         TabPanelIndex   =   0
         Text            =   "Welcome to Bugtracks, the dirt-simple bug tracker.\r\rTo create a new case, begin by searching for it.  Use shorter phrases that are more likely to generate a match, as different people use different terminology.\r\rIf you cannot find your case, then the ability to create a new case will present itself after you search."
         TextAlign       =   0
         TextColor       =   &h000000
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   54
         Transparent     =   True
         Underline       =   ""
         Visible         =   True
         Width           =   415
      End
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Resized()
		  // Created 4/15/2011 by Andrew Keller
		  
		  // Update the positions of the controls.
		  
		  RepositionControls
		  
		  // done.
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resizing()
		  // Created 4/15/2011 by Andrew Keller
		  
		  // Update the positions of the controls.
		  
		  RepositionControls
		  
		  // done.
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub RepositionControls()
		  // Created 4/15/2011 by Andrew Keller
		  
		  // Repositions the controls in this container based on the current scenario.
		  
		  msgrect.Left = ( Self.Width - msgrect.Width ) / 2
		  msgrect.Top = ( Self.Height - msgrect.Height ) / 2
		  
		  // done.
		  
		End Sub
	#tag EndMethod


#tag EndWindowCode

