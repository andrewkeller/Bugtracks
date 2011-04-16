#tag Window
Begin ContainerControl ctrSearchResultsPage Implements MainWindowView
   AcceptFocus     =   ""
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   2.15e+2
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
   Visible         =   False
   Width           =   350
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
      Selectable      =   True
      TabIndex        =   0
      TabPanelIndex   =   0
      Text            =   "Search Results for Something"
      TextAlign       =   0
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   14
      Transparent     =   False
      Underline       =   ""
      Visible         =   True
      Width           =   310
   End
   Begin Listbox lstQuery
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   ""
      Border          =   True
      ColumnCount     =   7
      ColumnsResizable=   ""
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   ""
      EnableDragReorder=   ""
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   149
      HelpTag         =   ""
      Hierarchical    =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Summary	Product	Category	Version	Status	Last Modified	Creator"
      Italic          =   ""
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   ""
      Scope           =   0
      ScrollbarHorizontal=   ""
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   46
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   310
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub Constructor(r As BTRepo, q As BTRepo.PresetQueries)
		  // Created 4/15/2011 by Andrew Keller
		  
		  // Initializes this class.
		  
		  Constructor
		  
		  If r Is Nil Then
		    
		    lblHead.Caption = "Cannot Perform a query on a Nil repository object."
		    
		  Else
		    
		    lblHead.Caption = BTRepo.Str( q )
		    
		  End If
		  
		  // done.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub c_EmbedWithin(containingWindow As Window, left As Integer = 0, top As Integer = 0, width As Integer = - 1, height As Integer = - 1)
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


#tag EndWindowCode

