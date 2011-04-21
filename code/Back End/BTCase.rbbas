#tag Class
Protected Class BTCase
Inherits SharedBTRepoCode
	#tag Method, Flags = &h0
		Sub Constructor(r As VolatileBTRepo, creator As BTPerson, headline As String, status As String, description As String)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(r As VolatileBTRepo, case_object As PropertyListKFS)
		  
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
		Function Status() As String
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Status(Assigns newValue As String)
		  
		End Sub
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
