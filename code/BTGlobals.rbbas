#tag Module
Protected Module BTGlobals
	#tag Method, Flags = &h0
		Function HumanReadablePath(Extends f As FolderItem, trailing_slash_for_dirs As Boolean = True) As String
		  // Created 4/15/2011 by Andrew Keller
		  
		  // Returns a human readable path that describes the path
		  // of the given FolderItem.  The result is NOT reversible.
		  // Don't try to use it to generate the original FolderItem.
		  
		  Dim slash As String = "/"
		  #if TargetWin32 then
		    slash = "\"
		  #endif
		  
		  Dim rslt As String = Join( f.PathArray, slash )
		  
		  #if Not TargetWin32 Then
		    rslt = slash + rslt
		  #endif
		  
		  If trailing_slash_for_dirs Or f.Directory Then rslt = rslt + slash
		  
		  Return rslt
		  
		  // done
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PathArray(Extends f As FolderItem) As String()
		  // Created 4/15/2011 by Andrew Keller
		  
		  // Returns the name of each directory entry in the given path, as an array.
		  
		  Dim result() As String
		  
		  While Not ( f Is Nil )
		    
		    result.Insert 0, f.Name
		    f = f.Parent
		    
		  Wend
		  
		  #if TargetMacOS then
		    If UBound( result ) > -1 Then result.Remove 0
		  #endif
		  
		  Return result
		  
		  // done.
		  
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub ViewEventHookMethod(v As MainWindowView, event_id As String)
	#tag EndDelegateDeclaration


	#tag Constant, Name = kViewEvent_Cancel, Type = String, Dynamic = False, Default = \"cancel", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kViewEvent_NewCase, Type = String, Dynamic = False, Default = \"newcase", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kViewEvent_Submit, Type = String, Dynamic = False, Default = \"submit", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
