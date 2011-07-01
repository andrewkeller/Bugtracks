#tag Class
Protected Class BTRepo
Inherits VolatileBTRepo
	#tag Method, Flags = &h0
		Sub Constructor()
		  // Created 4/15/2011 by Andrew Keller
		  
		  // Load the entire given directory into this class.
		  
		  p_dir = Nil
		  
		  Super.Constructor
		  
		  Reload
		  
		  // done.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(dir As FolderItem)
		  // Created 4/15/2011 by Andrew Keller
		  
		  // Load the entire given directory into this class.
		  
		  p_dir = dir
		  
		  Super.Constructor
		  
		  Reload
		  
		  // done.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InitializeRepoFolder()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadCaseObject(p As PropertyListKFS, pk As String)
		  // Created 4/21/2011 by Andrew Keller
		  
		  // Inserts the given case object into the database.
		  
		  Dim c As BTCase = BTCase.LoadExistingCase( Me, p, pk )
		  
		  // done.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Reload()
		  // Created 4/15/2011 by Andrew Keller
		  
		  // Reloads the entire source directory back
		  // into memory.  Same as the constructor,
		  // except it doesn't take a FolderItem
		  // argument or reinitialize the properties.
		  
		  Clear
		  
		  // First, we need to get a list of all the
		  // objects inside the pool directory.
		  
		  Dim settings_file, case_files() As FolderItem
		  ScanForObjects p_dir, settings_file, case_files
		  
		  // Next, parse the settings file:
		  
		  Dim settings As PropertyListKFS
		  Try
		    settings = New PropertyListKFS( settings_file )
		  Catch err
		  End Try
		  
		  // Next, we need to load all of the objects
		  // into BTCase objects in memory.
		  
		  For Each f As FolderItem In case_files
		    If Not ( f Is Nil ) Then
		      If f.Exists Then
		        
		        Dim name As String = f.Name
		        Dim ex As String = "." + kFileExtension
		        
		        If name.Right( Len( ex ) ) = ex Then name = name.Left( Len( name ) - Len( ex ) )
		        
		        Try
		          LoadCaseObject New PropertyListKFS( f ), name
		        Catch err
		        End Try
		        
		      End If
		    End If
		  Next
		  
		  // done.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RepoFolderInitialized() As Boolean
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RepositoryFolder() As FolderItem
		  // Created 4/15/2011 by Andrew Keller
		  
		  // Returns the FolderItem for the pool.
		  
		  Return p_dir
		  
		  // done.
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RepositoryFolder(Assigns newFolder As FolderItem)
		  // Created 4/15/2011 by Andrew Keller
		  
		  // Sets the FolderItem for the pool.
		  
		  p_dir = newFolder
		  
		  // done.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveChanges(pgd As ProgressDelegateKFS = Nil)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ScanForObjects(within_dir As FolderItem, ByRef config_file As FolderItem, ByRef case_files() As FolderItem)
		  // Created 4/15/2011 by Andrew Keller
		  
		  // Finds all of the Bugtracks objects stored in the given folder.
		  
		  // Initialize the result variables:
		  
		  config_file = Nil
		  ReDim case_files(-1)
		  
		  // Setup the data structures for the scan:
		  
		  Dim q As New DataChainKFS  // q for Queue
		  Dim r As New DataChainKFS  // r for Result, as in case_objs
		  
		  // Add the seed FolderItem:
		  
		  q.Append within_dir
		  
		  // Begin the scan.
		  
		  While Not q.IsEmpty
		    
		    // There is another item in the queue to inspect.
		    
		    Dim f As FolderItem = q.Pop
		    
		    If Not ( f Is Nil ) Then
		      If f.Exists Then
		        
		        // Inspect this item.
		        
		        If f.Directory Then
		          
		          // This is a folder; add its children to the queue.
		          
		          For idx As Integer = 1 To f.Count
		            q.Append f.Item( idx )
		          Next
		          
		        Else
		          
		          // This is a file; for now, the name is all that matters.
		          
		          Dim fname As String = f.Name
		          
		          If fname = kSettingsFileBasename + "." + kFileExtension Then
		            
		            config_file = f
		            
		          ElseIf fname.Right( Len( "." + kFileExtension ) ) = "." + kFileExtension Then
		            
		            r.Append f
		            
		          End If
		        End If
		      End If
		    End If
		  Wend
		  
		  // Copy the result queue into the case_objs array:
		  
		  Dim u As Integer = r.Count -1
		  ReDim case_files( u )
		  For i As Integer = 0 To u
		    case_files( i ) = r.Pop
		  Next
		  
		  // done.
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected p_dir As FolderItem
	#tag EndProperty


	#tag Constant, Name = kFileExtension, Type = String, Dynamic = False, Default = \"bugtracks", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kSettingsFileBasename, Type = String, Dynamic = False, Default = \"settings", Scope = Public
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
