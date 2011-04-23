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

	#tag Method, Flags = &h1000
		Sub Constructor(r As VolatileBTRepo, case_id As String)
		  
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
		  
		  Dim sql As PreparedSQLStatement = r.dbprep( "INSERT INTO ? ( ?, ?, ?, ?, ?, ? ) VALUES ( ?, ?, ?, ?, ?, ? )" )
		  
		  sql.SQLExecute _
		  kDB_Cases, _
		  kDB_CasePK, _
		  kDB_CaseHeadline, _
		  kDB_CaseCategory, _
		  kDB_CaseCreator, _
		  kDB_CaseCreationDate, _
		  kDB_CaseModificationDate, _
		  new_pk, _
		  new_headline, _
		  new_category, _
		  Str( new_creator, "" ), _
		  new_date, _
		  new_date
		  
		  sql = r.dbprep( "INSERT INTO ? ( ?, ?, ?, ? ) VALUES ( ?, ?, ?, ? )" )
		  
		  sql.SQLExecute _
		  kDB_StatusRevisions, _
		  kDB_StatusRevisionCase, _
		  kDB_StatusRevisionStatus, _
		  kDB_StatusRevisionAuthor, _
		  kDB_StatusRevisionDate, _
		  new_pk, _
		  new_status, _
		  Str( new_creator, "" ), _
		  new_date
		  
		  sql = r.dbprep( "INSERT INTO ? ( ?, ?, ?, ?, ?, ? ) VALUES ( ?, ?, ?, ?, ?, ? )" )
		  
		  sql.SQLExecute _
		  kDB_Discussions, _
		  kDB_DiscussionCase, _
		  kDB_DiscussionAuthor, _
		  kDB_DiscussionType, _
		  kDB_DiscussionText, _
		  kDB_DiscussionDate, _
		  kDB_DiscussionModDate, _
		  new_pk, _
		  Str( new_creator, "" ), _
		  new_msgtype, _
		  new_description, _
		  new_date, _
		  new_date
		  
		  sql = r.dbprep( "INSERT INTO ? ( ?, ? ) VALUES ( ?, ? )" )
		  
		  sql.SQLExecute _
		  kDB_Favorites, _
		  kDB_FavoriteCase, _
		  kDB_FavoritePerson, _
		  new_pk, _
		  new_status
		  
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
