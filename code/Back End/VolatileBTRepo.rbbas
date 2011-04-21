#tag Class
Protected Class VolatileBTRepo
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
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ListCasesWithKeywords(search_str As String) As BTSet
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ListPresetQueries() As PresetQueries()
		  // Created 4/15/2011 by Andrew Keller
		  
		  // Returns the list of all preset queries.
		  
		  Return Array ( _
		  PresetQueries.TopCases, _
		  PresetQueries.Newest, _
		  PresetQueries.RecentlyActive, _
		  PresetQueries.MyFavorites, _
		  PresetQueries.MyCases, _
		  PresetQueries.ParticipatingIn )
		  
		  // done.
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ShortStr(q As PresetQueries) As String
		  // Created 4/15/2011 by Andrew Keller
		  
		  // Returns a short string version of the description of the given query.
		  
		  Select Case q
		    
		  Case PresetQueries.TopCases
		    Return "Top Cases"
		    
		  Case PresetQueries.Newest
		    Return "Newest"
		    
		  Case PresetQueries.RecentlyActive
		    Return "Recently Active"
		    
		  Case PresetQueries.MyFavorites
		    Return "My Favorites"
		    
		  Case PresetQueries.MyCases
		    Return "My Cases"
		    
		  Case PresetQueries.ParticipatingIn
		    Return "Participating In"
		    
		  Else
		    Return "Unknown Query"
		    
		  End Select
		  
		  // done.
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Str(q As PresetQueries) As String
		  // Created 4/15/2011 by Andrew Keller
		  
		  // Returns a string version of the description of the given query.
		  
		  Select Case q
		    
		  Case PresetQueries.TopCases
		    Return "Top Cases"
		    
		  Case PresetQueries.Newest
		    Return "Newest Cases"
		    
		  Case PresetQueries.RecentlyActive
		    Return "Recently Active Cases"
		    
		  Case PresetQueries.MyFavorites
		    Return "My Favorite Cases"
		    
		  Case PresetQueries.MyCases
		    Return "My Cases"
		    
		  Case PresetQueries.ParticipatingIn
		    Return "Cases I'm Participating In"
		    
		  Else
		    Return "Unknown Query"
		    
		  End Select
		  
		  // done.
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Function subst(src As String, ParamArray subs As String) As String
		  // Created 4/20/2011 by Andrew Keller
		  
		  // A very simple substitution engine.
		  
		  Dim segs() As String = Split( src, "%" )
		  
		  If segs.Ubound <> subs.Ubound + 1 Then
		    
		    Dim err As New OutOfBoundsException
		    err.Message = "The number of substitution points does not match the number of given parameters."
		    Raise err
		    
		  End If
		  
		  Dim rslt As String = segs(0)
		  
		  For idx As Integer = 0 to subs.Ubound
		    
		    rslt = rslt + subs(idx)
		    rslt = rslt + segs(idx+1)
		    
		  Next
		  
		  Return rslt
		  
		  // done.
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected p_db As REALSQLDatabase
	#tag EndProperty


	#tag Constant, Name = kDB_CaseCategory, Type = String, Dynamic = False, Default = \"category", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDB_CaseCreationDate, Type = String, Dynamic = False, Default = \"cdate", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDB_CaseCreator, Type = String, Dynamic = False, Default = \"creator", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDB_CaseHeadline, Type = String, Dynamic = False, Default = \"headline", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDB_CaseModificationDate, Type = String, Dynamic = False, Default = \"mdate", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDB_CasePK, Type = String, Dynamic = False, Default = \"pk", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDB_Cases, Type = String, Dynamic = False, Default = \"cases", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDB_DiscussionAuthor, Type = String, Dynamic = False, Default = \"author", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDB_DiscussionCase, Type = String, Dynamic = False, Default = \"caseid", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDB_DiscussionDate, Type = String, Dynamic = False, Default = \"ts", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDB_DiscussionModDate, Type = String, Dynamic = False, Default = \"mts", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDB_Discussions, Type = String, Dynamic = False, Default = \"discussions", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDB_DiscussionText, Type = String, Dynamic = False, Default = \"text", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDB_DiscussionType, Type = String, Dynamic = False, Default = \"dtype", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDB_FavoriteCase, Type = String, Dynamic = False, Default = \"caseid", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDB_FavoritePerson, Type = String, Dynamic = False, Default = \"person", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDB_Favorites, Type = String, Dynamic = False, Default = \"fav", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDB_StatusRevisionAuthor, Type = String, Dynamic = False, Default = \"author", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDB_StatusRevisionCase, Type = String, Dynamic = False, Default = \"caseid", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDB_StatusRevisionDate, Type = String, Dynamic = False, Default = \"ts", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDB_StatusRevisions, Type = String, Dynamic = False, Default = \"statrevs", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kDB_StatusRevisionStatus, Type = String, Dynamic = False, Default = \"status", Scope = Protected
	#tag EndConstant


	#tag Enum, Name = PresetQueries, Flags = &h0
		Null
		  TopCases
		  Newest
		  RecentlyActive
		  MyFavorites
		  MyCases
		ParticipatingIn
	#tag EndEnum


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
