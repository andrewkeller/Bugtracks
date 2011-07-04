#tag Class
Protected Class VolatileBTRepo
Inherits SharedBTRepoCode
	#tag Method, Flags = &h0
		Sub Clear()
		  // Created 7/1/2011 by Andrew Keller
		  
		  // Clears the local database.
		  
		  For Each table As String In Array( _
		    kDB_Cases, _
		    kDB_StatusRevisions, _
		    kDB_Discussions, _
		    kDB_Favorites )
		    
		    dbexec subst( "DELETE FROM %", table )
		    
		  Next
		  
		  // done.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  // Created 4/20/2011 by Andrew Keller
		  
		  // Initialize this object.
		  
		  dbinit
		  
		  // done.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DataSourceSummary() As String
		  // Created 7/3/2011 by Andrew Keller
		  
		  // Returns a summary of the data source of this repository.
		  
		  Return kDataSourceMemory
		  
		  // done.
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub dbcommit()
		  // Created 4/23/2011 by Andrew Keller
		  
		  // Invokes a commit on the database.
		  
		  p_db.Commit
		  
		  // done.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub dbexec(sql As String)
		  // Created 4/20/2011 by Andrew Keller
		  
		  // Executes the given SQL Statement.
		  
		  p_db.SQLExecute sql
		  
		  If p_db.Error Then
		    
		    Dim e As New UnsupportedFormatException
		    e.ErrorNumber = p_db.ErrorCode
		    e.Message = p_db.ErrorMessage
		    Raise e
		    
		  End If
		  
		  // done.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub dbinit()
		  // Created 4/20/2011 by Andrew Keller
		  
		  // Initializes the local database.
		  
		  p_db = New REALSQLDatabase
		  
		  If p_db.Connect Then
		    
		    dbexec subst( "CREATE TABLE % ( % varchar, % varchar, % varchar, % varchar, % varchar, % varchar, PRIMARY KEY ( % ) )", _
		    kDB_Cases, _
		    kDB_CasePK, _
		    kDB_CaseHeadline, _
		    kDB_CaseCategory, _
		    kDB_CaseCreator, _
		    kDB_CaseCreationDate, _
		    kDB_CaseModificationDate, _
		    kDB_CasePK )
		    
		    dbexec subst( "CREATE TABLE % ( % varchar, % varchar, % varchar, % varchar, PRIMARY KEY ( % ) )", _
		    kDB_StatusRevisions, _
		    kDB_StatusRevisionCase, _
		    kDB_StatusRevisionStatus, _
		    kDB_StatusRevisionAuthor, _
		    kDB_StatusRevisionDate, _
		    kDB_StatusRevisionDate )
		    
		    dbexec subst( "CREATE TABLE % ( % varchar, % varchar, % varchar, % varchar, % varchar, % varchar, PRIMARY KEY ( % ) )", _
		    kDB_Discussions, _
		    kDB_DiscussionCase, _
		    kDB_DiscussionAuthor, _
		    kDB_DiscussionType, _
		    kDB_DiscussionText, _
		    kDB_DiscussionDate, _
		    kDB_DiscussionModDate, _
		    kDB_DiscussionDate )
		    
		    dbexec subst( "CREATE TABLE % ( % varchar, % varchar, % varchar, PRIMARY KEY ( %, % ) )", _
		    kDB_Favorites, _
		    kDB_FavoriteCase, _
		    kDB_FavoritePerson, _
		    kDB_FavoriteDate, _
		    kDB_FavoriteCase, _
		    kDB_FavoritePerson )
		    
		  End If
		  
		  // done.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub dbinsert(table_name As String, dbr As DatabaseRecord)
		  // Created 4/23/2011 by Andrew Keller
		  
		  // Inserts the given record into the database.
		  
		  p_db.InsertRecord table_name, dbr
		  
		  // done.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function dbprep(sql As String) As PreparedSQLStatement
		  // Created 4/23/2011 by Andrew Keller
		  
		  // Returns a PreparedSQLStatement for the given query.
		  
		  Return p_db.Prepare( sql )
		  
		  // done.
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub dbrollback()
		  // Created 4/23/2011 by Andrew Keller
		  
		  // Invokes a rollback on the database.
		  
		  p_db.Rollback
		  
		  // done.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function dbsel(sql As String) As RecordSet
		  // Created 4/20/2011 by Andrew Keller
		  
		  // Executes the given SQL Statement, and returns the result.
		  
		  Dim rs As RecordSet = p_db.SQLSelect( sql )
		  
		  If p_db.Error Then
		    
		    Dim e As New UnsupportedFormatException
		    e.ErrorNumber = p_db.ErrorCode
		    e.Message = p_db.ErrorMessage
		    Raise e
		    
		  End If
		  
		  Return rs
		  
		  // done.
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InsertCase(new_case As BTCase)
		  // Created 7/2/2011 by Andrew Keller
		  
		  // Inserts the given case object into the database.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function InsertNewCase(new_creator As BTPerson, new_headline As String, new_category As String, new_status As String, new_description As String, auto_favorite As Boolean) As BTCase
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
		  dbinsert kDB_Cases, dbr
		  
		  dbr = New DatabaseRecord
		  dbr.BlobColumn( kDB_StatusRevisionCase ) = new_pk
		  dbr.BlobColumn( kDB_StatusRevisionStatus ) = new_status
		  dbr.BlobColumn( kDB_StatusRevisionAuthor ) = Str( new_creator, "" )
		  dbr.Int64Column( kDB_StatusRevisionDate ) = new_date.TotalSeconds
		  dbinsert kDB_StatusRevisions, dbr
		  
		  dbr = New DatabaseRecord
		  dbr.BlobColumn( kDB_DiscussionCase ) = new_pk
		  dbr.BlobColumn( kDB_DiscussionAuthor ) = Str( new_creator, "" )
		  dbr.BlobColumn( kDB_DiscussionType ) = new_msgtype
		  dbr.BlobColumn( kDB_DiscussionText ) = new_description
		  dbr.Int64Column( kDB_DiscussionDate ) = new_date.TotalSeconds
		  dbr.Int64Column( kDB_DiscussionModDate ) = new_date.TotalSeconds
		  dbinsert kDB_Discussions, dbr
		  
		  If auto_favorite Then
		    dbr = New DatabaseRecord
		    dbr.BlobColumn( kDB_FavoriteCase ) = new_pk
		    dbr.BlobColumn( kDB_FavoritePerson ) = Str( new_creator, "" )
		    dbr.Int64Column( kDB_FavoriteDate ) = new_date.TotalSeconds
		    dbinsert kDB_Favorites, dbr
		  End If
		  
		  Return New BTCase( Me, new_pk )
		  
		  // done.
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ListCasesForQuery(q As PresetCaseQueries) As BTCaseSet
		  // Created 4/20/2011 by Andrew Keller
		  
		  // Returns the set of cases for the given query.
		  
		  Return BTCaseSet.NewFromQuery( Me, q )
		  
		  // done.
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ListCasesWithKeywords(search_str As String) As BTCaseSet
		  // Created 4/20/2011 by Andrew Keller
		  
		  // Returns the set of cases for the given query.
		  
		  Return BTCaseSet.NewFromSearch( Me, search_str )
		  
		  // done.
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected p_db As REALSQLDatabase
	#tag EndProperty


	#tag Constant, Name = kDataSourceMemory, Type = String, Dynamic = False, Default = \"Unsaved (private memory-backed SQLite database)", Scope = Public
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
End Class
#tag EndClass
