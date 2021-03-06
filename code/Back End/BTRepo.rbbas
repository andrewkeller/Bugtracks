#tag Class
Protected Class BTRepo
Inherits VolatileBTRepo
	#tag Method, Flags = &h0
		Sub Clear()
		  // Created 7/1/2011 by Andrew Keller
		  
		  // Adding onto VolatileBTRepo's Clear method.
		  
		  Super.Clear
		  
		  // Also clear the database on disk.
		  
		  If Not ( p_dir Is Nil ) Then
		    If p_dir.Exists Then
		      If p_dir.Directory Then
		        
		        Dim something_got_deleted As Boolean = False
		        
		        Do
		          
		          For idx As Integer = 1 To p_dir.Count
		            
		            Dim c As FolderItem = p_dir.Item( idx )
		            
		            If Not ( c Is Nil ) Then
		              If Not c.Directory Then
		                If c.Name.Right( Len( "." + kFileExtension ) ) = "." + kFileExtension _
		                  And c.Name <> kSettingsFileBasename + "." + kFileExtension Then
		                  
		                  c.Delete
		                  
		                  something_got_deleted = True
		                  
		                End If
		              End If
		            End If
		          Next
		          
		        Loop Until something_got_deleted = False
		        
		      End If
		    End If
		  End If
		  
		  // done.
		  
		End Sub
	#tag EndMethod

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
		Function DataSourceSummary() As String
		  // Created 7/3/2011 by Andrew Keller
		  
		  // Returns a summary of the data source of this repository.
		  
		  If p_dir Is Nil Then
		    
		    Return Super.DataSourceSummary
		    
		  Else
		    
		    Return p_dir.HumanReadablePath
		    
		  End If
		  
		  // done.
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InsertCase(new_case As BTCase)
		  // Created 7/2/2011 by Andrew Keller
		  
		  // Adding onto VolatileBTRepo's InsertCase method.
		  
		  Super.InsertCase new_case
		  
		  // Also add the case to the data pool.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadCase(new_case As BTCase)
		  // Created 7/2/2011 by Andrew Keller
		  
		  // A variant of InsertCase that only adds the case to the database, not the data pool.
		  
		  // This is effectively an alias for Super.InsertCase.
		  
		  Super.InsertCase new_case
		  
		  // done.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ProblemAccessingRepository() As Boolean
		  // Created 7/1/2011 by Andrew Keller
		  
		  // Returns whether or not there is a problem with the data pool.
		  
		  If p_dir Is Nil Then
		    
		    // The pool is Nil, aka not in use.
		    
		    Return False
		    
		  ElseIf p_dir.Directory = False Then
		    
		    // Ouch.  Currently, the data pool must be a folder.
		    
		    Return True
		    
		  Else
		    
		    // All seems good.
		    
		    Return False
		    
		  End If
		  
		  // done.
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Reload()
		  // Created 4/15/2011 by Andrew Keller
		  
		  // Reloads the entire source directory back
		  // into memory.  Same as the constructor,
		  // except it doesn't take a FolderItem
		  // argument or reinitialize the properties.
		  
		  // This is the opposite of the Reload method.
		  
		  Super.Clear  // Do NOT clear the database on disk!
		  
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
		          LoadCase BTCase.NewFromPList( New PropertyListKFS( f ), name )
		        Catch err
		        End Try
		        
		      End If
		    End If
		  Next
		  
		  // done.
		  
		End Sub
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
		Sub Resave(aggressive As Boolean = False)
		  // Created 7/2/2011 by Andrew Keller
		  
		  // Resaves the repository to the data pool,
		  // possibly blowing away anything in the way (aggressive).
		  
		  // This is the opposite of the Reload method.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Sub ScanForObjects(within_dir As FolderItem, ByRef config_file As FolderItem, ByRef case_files() As FolderItem)
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
