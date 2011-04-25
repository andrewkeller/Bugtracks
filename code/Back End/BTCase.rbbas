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
		  
		  inval_case = True
		  inval_discussion = True
		  inval_favorites = True
		  inval_status = True
		  
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
		 Shared Function InsertNewCase(r As VolatileBTRepo, new_creator As BTPerson, new_headline As String, new_category As String, new_status As String, new_description As String, auto_favorite As Boolean) As BTCase
		  // Created 4/23/2011 by Andrew Keller
		  
		  // Inserts the given case into the given repository,
		  // assuming that it is a brand new case.  If the
		  // repository is Nil, then a NilObjectException is raised.
		  
		  // First, assemble all the required components.
		  
		  Dim new_pk As String = GenerateNewPrimaryKey
		  // Headline is already set.
		  // Category is already set.
		  // Creator is already set.
		  Dim new_date As New Date
		  // Status is already set.
		  // The first message is already set.
		  Dim new_msgtype As String = kDiscussionTypeStandard
		  
		  
		  // Next, insert the new data.
		  
		  Dim dbr As New DatabaseRecord
		  dbr.BlobColumn( kDB_CasePK ) = new_pk
		  dbr.BlobColumn( kDB_CaseHeadline ) = new_headline
		  dbr.BlobColumn( kDB_CaseCategory ) = new_category
		  dbr.BlobColumn( kDB_CaseCreator ) = Str( new_creator, "" )
		  dbr.Int64Column( kDB_CaseCreationDate ) = new_date.TotalSeconds
		  dbr.Int64Column( kDB_CaseModificationDate ) = new_date.TotalSeconds
		  r.dbinsert kDB_Cases, dbr
		  
		  dbr = New DatabaseRecord
		  dbr.BlobColumn( kDB_StatusRevisionCase ) = new_pk
		  dbr.BlobColumn( kDB_StatusRevisionStatus ) = new_status
		  dbr.BlobColumn( kDB_StatusRevisionAuthor ) = Str( new_creator, "" )
		  dbr.Int64Column( kDB_StatusRevisionDate ) = new_date.TotalSeconds
		  r.dbinsert kDB_StatusRevisions, dbr
		  
		  dbr = New DatabaseRecord
		  dbr.BlobColumn( kDB_DiscussionCase ) = new_pk
		  dbr.BlobColumn( kDB_DiscussionAuthor ) = Str( new_creator, "" )
		  dbr.BlobColumn( kDB_DiscussionType ) = new_msgtype
		  dbr.BlobColumn( kDB_DiscussionText ) = new_description
		  dbr.Int64Column( kDB_DiscussionDate ) = new_date.TotalSeconds
		  dbr.Int64Column( kDB_DiscussionModDate ) = new_date.TotalSeconds
		  r.dbinsert kDB_Discussions, dbr
		  
		  If auto_favorite Then
		    dbr = New DatabaseRecord
		    dbr.BlobColumn( kDB_FavoriteCase ) = new_pk
		    dbr.BlobColumn( kDB_FavoritePerson ) = Str( new_creator, "" )
		    dbr.Int64Column( kDB_FavoriteDate ) = new_date.TotalSeconds
		    r.dbinsert kDB_Favorites, dbr
		  End If
		  
		  Return New BTCase( r, new_pk )
		  
		  // done.
		  
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
