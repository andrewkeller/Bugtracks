#tag Window
Begin ContainerControl ctrMainNav
   AcceptFocus     =   ""
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   200
   HelpTag         =   ""
   InitialParent   =   ""
   Left            =   3.2e+1
   LockBottom      =   True
   LockLeft        =   True
   LockRight       =   False
   LockTop         =   True
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Top             =   3.2e+1
   UseFocusRing    =   ""
   Visible         =   True
   Width           =   150
   Begin Listbox lstNav
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   ""
      Border          =   True
      ColumnCount     =   1
      ColumnsResizable=   ""
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   26
      Enabled         =   True
      EnableDrag      =   ""
      EnableDragReorder=   ""
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   ""
      HeadingIndex    =   -1
      Height          =   200
      HelpTag         =   ""
      Hierarchical    =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Start Page\rSearch\rTop Cases\rNewest\rRecently Active\rMy Favorites\rMy Cases\rParticipating In"
      Italic          =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   True
      Scope           =   0
      ScrollbarHorizontal=   ""
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   0
      Underline       =   ""
      UseFocusRing    =   False
      Visible         =   True
      Width           =   149
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Paint(g As Graphics)
		  // Created 4/15/2011 by Andrew Keller
		  
		  // Draw a simple line on the right side of this container.
		  
		  g.PenWidth = 1
		  g.PenHeight = 1
		  g.ForeColor = &c000000
		  
		  g.DrawLine g.Width -1, 0, g.Width -1, g.Height -1
		  
		  // done.
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddView(caption As String, view As MainWindowView, auto_select As Boolean = False)
		  // Created 4/15/2011 by Andrew Keller
		  
		  // Adds the given item to the listbox.
		  
		  SuppressEvents = True
		  
		  lstNav.AddRow caption
		  lstNav.RowTag( lstNav.LastIndex ) = view
		  
		  SuppressEvents = False
		  
		  If auto_select Then
		    
		    lstNav.ListIndex = lstNav.LastIndex
		    
		  ElseIf lstNav.ListCount = 1 Then
		    
		    ReportSelectionChanged
		    
		  End If
		  
		  // done.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ReportSelectionChanged()
		  // Created 4/15/2011 by Andrew Keller
		  
		  // If the selection in the listbox has changed, then report the new one.
		  
		  If lstNav.ListIndex < 0 Then
		    
		    ReportSelectionChanged "", Nil
		    
		  Else
		    
		    ReportSelectionChanged lstNav.List( lstNav.ListIndex ), lstNav.RowTag( lstNav.ListIndex )
		    
		  End If
		  
		  // done.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ReportSelectionChanged(newsel_c As String, newsel_v As Variant)
		  // Created 4/15/2011 by Andrew Keller
		  
		  // If the selection in the listbox has changed, then report the new one.
		  
		  If p_oldsel_c <> newsel_c Or p_oldsel_v <> newsel_v Then
		    
		    RaiseEvent SelectionChanged MainWindowView( p_oldsel_v ), MainWindowView( newsel_v )
		    
		    p_oldsel_c = newsel_c
		    p_oldsel_v = newsel_v
		    
		  End If
		  
		  // done.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SuppressEvents() As Boolean
		  // Created 4/15/2011 by Andrew Keller
		  
		  // Reports the status of SuppressEvents.
		  
		  Return p_supev > 0
		  
		  // done.
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SuppressEvents(Assigns newValue As Boolean)
		  // Created 4/15/2011 by Andrew Keller
		  
		  // Increments or Decrements SuppressEvents.
		  
		  If newValue Then
		    
		    p_supev = p_supev + 1
		    
		  Else
		    
		    p_supev = p_supev - 1
		    
		  End If
		  
		  // done.
		  
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event SelectionChanged(old_sel As MainWindowView, new_sel As MainWindowView)
	#tag EndHook


	#tag Property, Flags = &h21
		Private p_oldsel_c As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private p_oldsel_v As Variant
	#tag EndProperty

	#tag Property, Flags = &h21
		Private p_supev As Integer
	#tag EndProperty


#tag EndWindowCode

#tag Events lstNav
	#tag Event
		Sub Change()
		  // Created 4/15/2011 by Andrew Keller
		  
		  // Possibly report that the selection has changed.
		  
		  ReportSelectionChanged
		  
		  // done.
		  
		End Sub
	#tag EndEvent
#tag EndEvents
