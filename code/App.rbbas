#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub NewDocument()
		  // Created 4/15/2011 by Andrew Keller
		  
		  // The user wants to open a new bug repository.
		  
		  Dim w As New frmMain( New BTRepo( Nil ) )
		  w.Show
		  
		  // done.
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub OpenDocument(item As FolderItem)
		  // Created 4/15/2011 by Andrew Keller
		  
		  // The user wants to open an existing bug repository.
		  
		  // See if this repository is already open.
		  
		  For idx As Integer = 0 To WindowCount -1
		    
		    If Window(idx) IsA frmMain Then
		      
		      If frmMain( Window(idx) ).IsAccessingFolder( item ) Then
		        
		        Window(idx).Show
		        
		        Return
		        
		      End If
		    End If
		  Next
		  
		  // No windows are currently showing this FolderItem.
		  
		  // Create one.
		  
		  Dim w As New frmMain( New BTRepo( item ) )
		  w.Show
		  
		  // done.
		  
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function FileNew() As Boolean Handles FileNew.Action
			// Created 7/3/2011 by Andrew Keller
			
			// The user has requested a new repository.
			
			NewDocument
			
			Return True
			
			// done.
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileOpen() As Boolean Handles FileOpen.Action
			// Created 7/3/2011 by Andrew Keller
			
			// The user wants to open an existing repository.
			
			Dim sfd As New SelectFolderDialog
			sfd.ActionButtonCaption = "Open"
			sfd.PromptText = "Please select a Bugtracks folder."
			sfd.Title = "Open Repository"
			
			Dim f As FolderItem = sfd.ShowModal
			
			If f Is Nil Then
			
			// The user clicked cancel.
			// Do nothing.
			
			Else
			
			OpenDocument f
			
			End If
			
			Return True
			
			// done.
			
		End Function
	#tag EndMenuHandler


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
