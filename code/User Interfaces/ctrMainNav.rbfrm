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
   Left            =   32
   LockBottom      =   True
   LockLeft        =   True
   LockRight       =   False
   LockTop         =   True
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Top             =   32
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
      InitialValue    =   ""
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
		Function ActiveView() As MainWindowView
		  // Created 4/23/2011 by Andrew Keller
		  
		  // Returns the currently active view in this navigation bar.
		  
		  If lstNav.ListIndex < 0 Then
		    
		    Return Nil
		    
		  Else
		    
		    Return MainWindowView( lstNav.RowTag( lstNav.ListIndex ) )
		    
		  End If
		  
		  // done.
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ActiveView(Assigns view As MainWindowView)
		  // Created 4/23/2011 by Andrew Keller
		  
		  // Sets the active view in this navigation bar.  If the given
		  // view does not exist, then a KeyNotFoundException is raised.
		  
		  For row As Integer = 0 To lstNav.ListCount -1
		    
		    If lstNav.RowTag( row ) Is view Then
		      
		      lstNav.ListIndex = row
		      
		      Return
		      
		    End If
		    
		  Next
		  
		  Dim err As New KeyNotFoundException
		  err.Message = "Cannot select the given view ("+ObjectDescriptionKFS(view)+") because it was not found in the list."
		  Raise err
		  
		  // done.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddView(caption As String, view As MainWindowView, auto_select As Boolean = False)
		  // Created 4/15/2011 by Andrew Keller
		  
		  // Adds the given item to the listbox.
		  
		  lstNav.AddRow caption
		  lstNav.RowTag( lstNav.LastIndex ) = view
		  
		  If auto_select Then
		    
		    lstNav.ListIndex = lstNav.LastIndex
		    
		  End If
		  
		  ReportSelectionChanged
		  
		  // done.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Label(forView As MainWindowView) As String
		  // Created 4/23/2011 by Andrew Keller
		  
		  // Returns the current label for the given view.  If the given
		  // view does not exist, then a KeyNotFoundException is raised.
		  
		  For row As Integer = 0 To lstNav.ListCount -1
		    
		    If lstNav.RowTag( row ) Is forView Then
		      
		      Return lstNav.List( row )
		      
		    End If
		    
		  Next
		  
		  Dim err As New KeyNotFoundException
		  err.Message = "Cannot get the label for the given view ("+ObjectDescriptionKFS(forView)+") because it was not found in the list."
		  Raise err
		  
		  // done.
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Label(forView As MainWindowView, Assigns newValue As String)
		  // Created 4/23/2011 by Andrew Keller
		  
		  // Sets the label for the given view.  If the given view
		  // does not exist, then a KeyNotFoundException is raised.
		  
		  For row As Integer = 0 To lstNav.ListCount -1
		    
		    If lstNav.RowTag( row ) Is forView Then
		      
		      lstNav.List( row ) = newValue
		      
		      Return
		      
		    End If
		    
		  Next
		  
		  Dim err As New KeyNotFoundException
		  err.Message = "Cannot set the label for the given view ("+ObjectDescriptionKFS(forView)+") because it was not found in the list."
		  Raise err
		  
		  // done.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RefreshAllViews()
		  // Created 7/3/2011 by Andrew Keller
		  
		  // Invokes Update on all of the views.
		  
		  For row As Integer = 0 To lstNav.ListCount -1
		    
		    Dim c As MainWindowView = lstNav.RowTag( row )
		    
		    If Not ( c Is Nil ) Then
		      
		      c.Update
		      
		    End If
		  Next
		  
		  // done.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveAllViews()
		  // Created 7/3/2011 by Andrew Keller
		  
		  // Removes all views in this control.
		  
		  lstNav.DeleteAllRows
		  
		  // done.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveView(view As MainWindowView)
		  // Created 4/15/2011 by Andrew Keller
		  
		  // Removes all views that match the given view object.
		  
		  For row As Integer = lstNav.ListCount -1 DownTo 0
		    
		    If lstNav.RowTag( row ) Is view Then
		      
		      lstNav.RemoveRow row
		      
		    End If
		    
		  Next
		  
		  If lstNav.ListIndex < 0 And lstNav.ListCount > 0 Then
		    
		    lstNav.ListIndex = 0
		    
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
