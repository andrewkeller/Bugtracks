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
   Width           =   9.0e+2
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
		Sub Constructor()
		  // Created 7/3/2011 by Andrew Keller
		  
		  // Initializes this class.
		  
		  Super.Constructor
		  
		  ReloadWith New BTRepo
		  
		  // done.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(r As BTRepo)
		  // Created 4/15/2011 by Andrew Keller
		  
		  // Initializes this class.
		  
		  Super.Constructor
		  
		  ReloadWith r
		  
		  // done.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(f As FolderItem)
		  // Created 7/3/2011 by Andrew Keller
		  
		  // Initializes this class.
		  
		  Super.Constructor
		  
		  ReloadWith f
		  
		  // done.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FitAndEmbed(v As MainWindowView)
		  // Created 4/15/2011 by Andrew Keller
		  
		  // Embeds the given container control within this window.
		  
		  If Not ( v Is Nil ) Then
		    
		    v.EventHook = AddressOf ViewEventHook
		    
		    Dim l, t, w, h As Integer
		    l = NavBar.Left + NavBar.Width
		    t = 0
		    w = Self.Width - l
		    h = Self.Height
		    
		    v.EmbedWithin1 Self, l, t, w, h
		    
		  End If
		  
		  // done.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsAccessingFolder(f As FolderItem) As Boolean
		  // Created 7/3/2011 by Andrew Keller
		  
		  // Returns whether or not this window is currently
		  // viewing the database located at the given FolderItem f.
		  
		  If p_repo Is Nil Then
		    
		    Return f Is Nil
		    
		  ElseIf p_repo.RepositoryFolder Is Nil Then
		    
		    Return f Is Nil
		    
		  Else
		    
		    Return p_repo.RepositoryFolder.EqualsKFS( f )
		    
		  End If
		  
		  // done.
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub RefreshUserInterface()
		  // Created 7/3/2011 by Andrew Keller
		  
		  // Refreshes the currently displayed view(s).
		  
		  NavBar.RefreshAllViews
		  
		  // done.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Reload()
		  // Created 7/3/2011 by Andrew Keller
		  
		  // Issues a Reload on the repository, and refreshes the user interface.
		  
		  If Not ( p_repo Is Nil ) Then
		    
		    p_repo.Reload
		    
		    RefreshUserInterface
		    
		  End If
		  
		  // done.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ReloadNavBar()
		  // Created 7/3/2011 by Andrew Keller
		  
		  // Add all the default pages to the Navigation Bar.
		  
		  NavBar.RemoveAllViews
		  
		  Dim repo_all_good As Boolean = False
		  If Not ( p_repo Is Nil ) Then
		    If Not p_repo.ProblemAccessingRepository Then
		      repo_all_good = True
		    End If
		  End If
		  
		  Dim c As MainWindowView
		  
		  c = New ctrStartPage( p_repo )
		  FitAndEmbed c
		  NavBar.AddView "Start Page", c, repo_all_good
		  
		  c = New ctrSettings( p_repo )
		  FitAndEmbed c
		  NavBar.AddView "Settings", c, Not repo_all_good
		  
		  c = New ctrSearchPage( p_repo )
		  FitAndEmbed c
		  NavBar.AddView "Search", c
		  
		  For Each q As BTRepo.PresetCaseQueries In BTRepo.ListPresetCaseQueries
		    
		    c = New ctrSearchResultsPage( p_repo, q )
		    FitAndEmbed c
		    NavBar.AddView BTRepo.ShortStr(q), c
		    
		  Next
		  
		  // done.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ReloadUserInterface()
		  // Created 7/3/2011 by Andrew Keller
		  
		  // Reloads the user interface.
		  // Used when p_repo is swapped out.
		  
		  // Reload the navigation bar:
		  
		  ReloadNavBar
		  
		  // done.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReloadWith(repo As BTRepo)
		  // Created 7/3/2011 by Andrew Keller
		  
		  // A simple script that reloads this window
		  // with the given BTRepo object.
		  
		  p_repo = repo
		  
		  ReloadUserInterface
		  
		  // done.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReloadWith(f As FolderItem)
		  // Created 7/3/2011 by Andrew Keller
		  
		  // A simple script that reloads this window with
		  // a BTRepo object generated from the given FolderItem.
		  
		  p_repo = New BTRepo( f )
		  
		  ReloadUserInterface
		  
		  // done.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Resave(aggressive As Boolean = False)
		  // Created 7/3/2011 by Andrew Keller
		  
		  // Issues a Resave on the repository, and updates the user interface.
		  
		  If Not ( p_repo Is Nil ) Then
		    
		    p_repo.Resave aggressive
		    
		    RefreshUserInterface
		    
		  End If
		  
		  // done.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ruve(v As MainWindowView, event_id As String)
		  // Created 4/23/2011 by Andrew Keller
		  
		  // Informs the user that the given event was not handled.
		  
		  #if DebugBuild then
		    MsgBox "Unsupported event in "+Introspection.GetType(v).Name+": '"+event_id+"'"
		  #endif
		  
		  // done.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SwapViewTo(show_view As MainWindowView, ParamArray hide_view As MainWindowView)
		  // Created 4/15/2011 by Andrew Keller
		  
		  // Shows and hides the given views.
		  
		  If Not ( show_view Is Nil ) Then
		    
		    show_view.Update
		    show_view.Visible1 = True
		    
		  End If
		  
		  For Each v As MainWindowView In hide_view
		    
		    If Not ( v Is Nil ) Then v.Visible1 = False
		    
		  Next
		  
		  // done.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ViewEventHook(v As MainWindowView, event_id As String)
		  // Created 4/23/2011 by Andrew Keller
		  
		  // Handle any events from the views.
		  
		  If v IsA ctrSearchPage Then
		    
		    If event_id = kViewEvent_NewCase Then
		      
		      Dim nv As New ctrNewCase
		      FitAndEmbed nv
		      NavBar.AddView "New Case", nv, True
		      
		    Else
		      ruve v, event_id
		    End If
		    
		  ElseIf v IsA ctrNewCase Then
		    
		    If event_id = kViewEvent_Cancel Then
		      
		      NavBar.RemoveView v
		      
		    ElseIf event_id = kViewEvent_UpdateLabel Then
		      
		      Dim h As String = ctrNewCase( v ).Headline
		      If h = "" Then h = "New Case"
		      NavBar.Label( v ) = h
		      
		    ElseIf event_id = kViewEvent_Submit Then
		      
		      Dim nc As ctrNewCase = ctrNewCase( v )
		      
		      Dim c As New ctrViewCase( p_repo.InsertNewCase( nc.Creator, nc.Headline, nc.Category, nc.Status, nc.Description, True ) )
		      FitAndEmbed c
		      NavBar.AddView nc.Headline, c, True
		      NavBar.RemoveView v
		      
		    Else
		      ruve v, event_id
		    End If
		    
		  Else
		    ruve v, event_id
		  End If
		  
		  // done.
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected p_repo As BTRepo
	#tag EndProperty


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
