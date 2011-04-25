#tag Class
Protected Class SharedBTRepoCode
	#tag Method, Flags = &h1
		Protected Sub dbcommit()
		  // Created 4/23/2011 by Andrew Keller
		  
		  // This method exists only to allow all classes
		  // that inherit from this class access to this method,
		  // which is currently only implemented in VolatileBTRepo.
		  
		  // Since this method is currently not implemented
		  // in this class, raise an exception.
		  
		  Dim e As New UnsupportedFormatException
		  e.ErrorNumber = 1
		  e.Message = "The "+CurrentMethodName+" method is not available in this class."
		  Raise e
		  
		  // done.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub dbexec(sql As String)
		  // Created 4/20/2011 by Andrew Keller
		  
		  // This method exists only to allow all classes
		  // that inherit from this class access to this method,
		  // which is currently only implemented in VolatileBTRepo.
		  
		  // Since this method is currently not implemented
		  // in this class, raise an exception.
		  
		  Dim e As New UnsupportedFormatException
		  e.ErrorNumber = 1
		  e.Message = "The "+CurrentMethodName+" method is not available in this class."
		  Raise e
		  
		  // done.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub dbinsert(table_name As String, dbr As DatabaseRecord)
		  // Created 4/20/2011 by Andrew Keller
		  
		  // This method exists only to allow all classes
		  // that inherit from this class access to this method,
		  // which is currently only implemented in VolatileBTRepo.
		  
		  // Since this method is currently not implemented
		  // in this class, raise an exception.
		  
		  Dim e As New UnsupportedFormatException
		  e.ErrorNumber = 1
		  e.Message = "The "+CurrentMethodName+" method is not available in this class."
		  Raise e
		  
		  // done.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function dbprep(sql As String) As PreparedSQLStatement
		  // Created 4/23/2011 by Andrew Keller
		  
		  // This method exists only to allow all classes
		  // that inherit from this class access to this method,
		  // which is currently only implemented in VolatileBTRepo.
		  
		  // Since this method is currently not implemented
		  // in this class, raise an exception.
		  
		  Dim e As New UnsupportedFormatException
		  e.ErrorNumber = 1
		  e.Message = "The "+CurrentMethodName+" method is not available in this class."
		  Raise e
		  
		  // done.
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub dbrollback()
		  // Created 4/23/2011 by Andrew Keller
		  
		  // This method exists only to allow all classes
		  // that inherit from this class access to this method,
		  // which is currently only implemented in VolatileBTRepo.
		  
		  // Since this method is currently not implemented
		  // in this class, raise an exception.
		  
		  Dim e As New UnsupportedFormatException
		  e.ErrorNumber = 1
		  e.Message = "The "+CurrentMethodName+" method is not available in this class."
		  Raise e
		  
		  // done.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function dbsel(sql As String) As RecordSet
		  // Created 4/20/2011 by Andrew Keller
		  
		  // This method exists only to allow all classes
		  // that inherit from this class access to this method,
		  // which is currently only implemented in VolatileBTRepo.
		  
		  // Since this method is currently not implemented
		  // in this class, raise an exception.
		  
		  Dim e As New UnsupportedFormatException
		  e.ErrorNumber = 1
		  e.Message = "The "+CurrentMethodName+" method is not available in this class."
		  Raise e
		  
		  // done.
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Function GenerateNewPrimaryKey() As String
		  // Created 4/23/2011 by Andrew Keller
		  
		  // Returns a new primary key for a new case.
		  // This key is supposed to be globally unique,
		  // across repositories and even computers.
		  // To help enforce this, this method is a
		  // Shared method that takes no parameters,
		  // and knows nothing about the repository.
		  
		  // For now, this algorithm returns a unique key
		  // within a single second.  When this program
		  // becomes more stable, this algorithm should
		  // be changed to allow for multiple unique keys
		  // within a second.
		  
		  Dim d As New Date
		  Return d.SQLDateTime
		  
		  // done.
		  
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

	#tag Constant, Name = kDB_FavoriteDate, Type = String, Dynamic = False, Default = \"ts", Scope = Protected
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

	#tag Constant, Name = kDiscussionTypeStandard, Type = String, Dynamic = False, Default = \"standard", Scope = Protected
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
