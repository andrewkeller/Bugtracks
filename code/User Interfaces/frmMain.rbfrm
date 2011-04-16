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
   Width           =   900
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
	#tag Method, Flags = &h1000
		Sub Constructor(r As BTRepo)
		  // Created 4/15/2011 by Andrew Keller
		  
		  // Initializes this class.
		  
		  Constructor
		  
		  // Add all the default pages to the Navigation Bar.
		  
		  Dim repo_all_good As Boolean = False
		  If Not ( r Is Nil ) Then
		    If r.RepoFolderInitialized Then
		      repo_all_good = True
		    End If
		  End If
		  
		  Dim c As MainWindowView
		  
		  c = New ctrStartPage( r )
		  FitAndEmbed c
		  NavBar.AddView "Start Page", c, repo_all_good
		  
		  c = New ctrSettings( r )
		  FitAndEmbed c
		  NavBar.AddView "Settings", c, Not repo_all_good
		  
		  c = New ctrSearchPage( r )
		  FitAndEmbed c
		  NavBar.AddView "Search", c
		  
		  For Each q As BTRepo.PresetQueries In BTRepo.ListPresetQueries
		    
		    c = New ctrSearchResultPage( r, q )
		    FitAndEmbed c
		    NavBar.AddView BTRepo.ShortStr(q), c
		    
		  Next
		  
		  // done.
		  
		End Sub
	#tag EndMethod

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
		  
		  If Not ( show_view Is Nil ) Then
		    
		    show_view.Update
		    show_view.c_Visible = True
		    
		  End If
		  
		  For Each v As MainWindowView In hide_view
		    
		    If Not ( v Is Nil ) Then v.c_Visible = False
		    
		  Next
		  
		  // done.
		  
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events NavBar
	#tag Event
		Sub SelectionChanged(old_sel As MainWindowView, new_sel As MainWindowView)
		  // Created 4/15/2011 by Andrew Keller
		  
		  // The selection in the listbox changed.  Update the UI.
		  
		  SwapViewTo new_sel, old_sel
		  
		  // done.
		  
		End Sub
	#tag EndEvent
#tag EndEvents
