#tag Class
Protected Class BTCase
Inherits SharedBTRepoCode
	#tag Method, Flags = &h0
		Function Category() As String
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Category(Assigns newValue As String)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1001
		Protected Sub Constructor()
		  // Created 4/23/2011 by Andrew Keller
		  
		  // Basic constructor.  Only accessible from this class.
		  
		  // done.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Creator() As BTPerson
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Creator(Assigns newCreator As BTPerson)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FavoritedBy(person As BTPerson) As Boolean
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FavoritedBy(person As BTPerson, Assigns newValue As Boolean)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Headline() As String
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Headline(Assigns newValue As String)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function InsertNewCase(r As VolatileBTRepo, creator As BTPerson, headline As String, status As String, description As String, auto_favorite As Boolean) As BTCase
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		 Shared Function LoadExistingCase(r As VolatileBTRepo, case_object As PropertyListKFS, pk As String) As BTCase
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Status() As String
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Status(Assigns newValue As String)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StyledBody() As StyledText
		  
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
