#tag Class
Protected Class BTSet
Inherits SharedBTRepoCode
	#tag Method, Flags = &h0
		Function CaseCount() As Integer
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1001
		Protected Sub Constructor()
		  // Created 4/23/2011 by Andrew Keller
		  
		  // Basic constructor.  Only accessible from this class.
		  
		  // done.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NewFromQuery(r As VolatileBTRepo, q As PresetQueries) As BTSet
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		 Shared Function NewFromQuery(r As VolatileBTRepo, kws As String) As BTSet
		  
		End Function
	#tag EndMethod


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
End Class
#tag EndClass
