#tag Window
Begin Window frmMain
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   400
   ImplicitInstance=   False
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   2095634740
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Bugtracks"
   Visible         =   False
   Width           =   600
   Begin ctrMainNav NavBar
      AcceptFocus     =   ""
      AcceptTabs      =   True
      AutoDeactivate  =   True
      BackColor       =   &hFFFFFF
      Backdrop        =   ""
      Enabled         =   True
      EraseBackground =   True
      HasBackColor    =   False
      Height          =   400
      HelpTag         =   ""
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      UseFocusRing    =   ""
      Visible         =   True
      Width           =   150
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub FitAndEmbed(v As MainWindowView)
		  // Created 4/15/2011 by Andrew Keller
		  
		  // Embeds the given container control within this window.
		  
		  If Not ( v Is Nil ) Then
		    
		    Dim l, t, w, h As Integer
		    l = NavBar.Left + NavBar.Width
		    t = 0
		    w = Self.Width - l
		    h = Self.Height
		    
		    v.c_EmbedWithin Self, l, t, w, h
		    
		  End If
		  
		  // done.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SwapViewTo(show_view As MainWindowView, ParamArray hide_view As MainWindowView)
		  // Created 4/15/2011 by Andrew Keller
		  
		  // Shows and hides the given views.
		  
		  If Not ( show_view Is Nil ) Then show_view.c_Visible = True
		  
		  For Each v As MainWindowView In hide_view
		    
		    If Not ( v Is Nil ) Then v.c_Visible = False
		    
		  Next
		  
		  // done.
		  
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events NavBar
	#tag Event
		Sub Open()
		  // Created 4/15/2011 by Andrew Keller
		  
		  // Add all the default pages to the Navigation Bar.
		  
		  Dim c As MainWindowView
		  
		  c = New ctrStartPage
		  FitAndEmbed c
		  NavBar.AddView "Start Page", c, True
		  
		  c = Nil
		  FitAndEmbed c
		  NavBar.AddView "Search", c
		  
		  c = Nil
		  FitAndEmbed c
		  NavBar.AddView "Top Cases", c
		  
		  c = Nil
		  FitAndEmbed c
		  NavBar.AddView "Newest", c
		  
		  c = Nil
		  FitAndEmbed c
		  NavBar.AddView "Recently Active", c
		  
		  c = Nil
		  FitAndEmbed c
		  NavBar.AddView "My Favorites", c
		  
		  c = Nil
		  FitAndEmbed c
		  NavBar.AddView "My Cases", c
		  
		  c = Nil
		  FitAndEmbed c
		  NavBar.AddView "Participating In", c
		  
		  // done.
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub SelectionChanged(old_sel As MainWindowView, new_sel As MainWindowView)
		  // Created 4/15/2011 by Andrew Keller
		  
		  // The selection in the listbox changed.  Update the UI.
		  
		  SwapViewTo new_sel, old_sel
		  
		  // done.
		  
		End Sub
	#tag EndEvent
#tag EndEvents
