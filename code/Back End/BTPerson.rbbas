#tag Class
Protected Class BTPerson
Inherits SharedBTRepoCode
	#tag Method, Flags = &h0
		Sub Constructor(new_name_email As String)
		  // Created 4/21/2011 by Andrew Keller
		  
		  // Sets up this object with the given signature.
		  
		  Dim ems, eme As Integer
		  ems = InStr( new_name_email, "<" )
		  eme = InStr( ems, new_name_email, ">" )
		  
		  p_name = Mid( new_name_email, 1, ems -1 ).Trim
		  p_email = Mid( new_name_email, ems + 1, eme - ems - 2 ).Trim
		  
		  // done.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(new_name As String, new_email As String)
		  // Created 4/21/2011 by Andrew Keller
		  
		  // Sets up this object with the given parameters.
		  
		  p_name = new_name
		  p_email = new_email
		  
		  // done.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Email() As String
		  // Created 4/21/2011 by Andrew Keller
		  
		  // Returns the email address of this person.
		  
		  Return p_email
		  
		  // done.
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Name() As String
		  // Created 4/21/2011 by Andrew Keller
		  
		  // Returns the name of this person.
		  
		  Return p_name
		  
		  // done.
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(other As String)
		  // Created 4/21/2011 by Andrew Keller
		  
		  // A convert constructor that takes a string.
		  
		  Constructor other
		  
		  // done.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Signature() As String
		  // Created 4/21/2011 by Andrew Keller
		  
		  // Returns the signature of this person.
		  
		  If p_name = "" And p_email = "" Then
		    
		    Return ""
		    
		  ElseIf p_name = "" Then
		    
		    Return "<" + p_email + ">"
		    
		  ElseIf p_email = "" Then
		    
		    Return p_name
		    
		  Else
		    
		    Return p_name + " <" + p_email + ">"
		    
		  End If
		  
		  // done.
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected p_email As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected p_name As String
	#tag EndProperty


End Class
#tag EndClass
