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

	#tag Method, Flags = &h1000
		Sub Constructor(r As VolatileBTRepo, case_id As String)
		  // Created 4/23/2011 by Andrew Keller
		  
		  // A constructor that takes a repository and a case id.
		  
		  p_repo = r
		  p_caseid = case_id
		  
		  Invalidate
		  
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
		Sub Invalidate()
		  // Created 4/25/2011 by Andrew Keller
		  
		  // Causes the data stored in this object to be
		  // considered out-of-date, and will be reloaded
		  // the next time an accessor is called.
		  
		  p_case_load_error = False
		  
		  inval_case = True
		  inval_discussion = True
		  inval_favorites = True
		  inval_status = True
		  
		  // done.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub load_case(force_reload As Boolean = False)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub load_discussion(force_reload As Boolean = False)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub load_favorites(force_reload As Boolean = False)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub load_status(force_reload As Boolean = False)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		 Shared Function NewFromPList(case_object As PropertyListKFS, pk As String) As BTCase
		  // Created 7/2/2011 by Andrew Keller
		  
		  // A constructor that takes a case plist and its primary key, and returns a case object.
		  
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


	#tag Property, Flags = &h1
		Protected case_category As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected case_creator As BTPerson
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected case_date As Date
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected case_disc_author() As BTPerson
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected case_disc_date() As Date
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected case_disc_moddate() As Date
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected case_disc_text() As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected case_disc_type() As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected case_favorite_by() As BTPerson
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected case_favorite_date() As BTPerson
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected case_headline As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected case_moddate As Date
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected case_status_committer() As BTPerson
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected case_status_date As Date
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected case_status_value() As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected inval_case As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected inval_discussion As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected inval_favorites As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected inval_status As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected p_caseid As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected p_case_load_error As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected p_repo As VolatileBTRepo
	#tag EndProperty


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
