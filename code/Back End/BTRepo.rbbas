#tag Class
Protected Class BTRepo
	#tag Method, Flags = &h0
		Sub Constructor(dir As FolderItem)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InitializeRepoFolder()
		  
		End Sub
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
		Sub Reload()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RepoFolderInitialized() As Boolean
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RepositoryFolder() As FolderItem
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RunPresetQuery(q As PresetQueries) As BTSet
		  
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


	#tag Enum, Name = PresetQueries, Flags = &h0
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
