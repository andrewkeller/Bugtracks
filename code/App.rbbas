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
