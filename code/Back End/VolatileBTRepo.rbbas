#tag Class
Protected Class VolatileBTRepo
Inherits SharedBTRepoCode
	#tag Method, Flags = &h0
		Sub Constructor()
		  // Created 4/20/2011 by Andrew Keller
		  
		  // Initialize this object.
		  
		  dbinit
		  
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
		    
		    dbexec subst( "CREATE TABLE % ( % varchar, % varchar, % varchar, PRIMARY KEY ( % ) )", _
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
		    
		    dbexec subst( "CREATE TABLE % ( % varchar, % varchar, PRIMARY KEY ( % ) )", _
		    kDB_Favorites, _
		    kDB_FavoriteCase, _
		    kDB_FavoritePerson, _
		    kDB_FavoriteCase )
		    
		  End If
		  
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
		Function ListCasesForQuery(q As PresetQueries) As BTSet
		  // Created 4/20/2011 by Andrew Keller
		  
		  // Returns the set of cases for the given query.
		  
		  Return New BTSet( Me, q )
		  
		  // done.
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ListCasesWithKeywords(search_str As String) As BTSet
		  // Created 4/20/2011 by Andrew Keller
		  
		  // Returns the set of cases for the given query.
		  
		  Return New BTSet( Me, search_str )
		  
		  // done.
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected p_db As REALSQLDatabase
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
