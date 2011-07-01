#tag Class
Protected Class BTPersonSet
Inherits SharedBTRepoCode
	#tag Method, Flags = &h1001
		Protected Sub Constructor()
		  // Created 6/30/2011 by Andrew Keller
		  
		  // Basic constructor.  Only accessible from this class.
		  
		  // done.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Count() As Integer
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function NewFromQuery(r As VolatileBTRepo, q As PresetQueries) As BTPersonSet
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Person(index As Integer) As BTPerson
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Refresh()
		  
		End Sub
	#tag EndMethod


End Class
#tag EndClass
