#tag Class
Protected Class BTSet
	#tag Method, Flags = &h0
		Function CaseCount() As Integer
		  // Created 4/19/2011 by Andrew Keller
		  
		  // Returns the number of cases in this set.
		  
		  Return UBound( p_cases ) + 1
		  
		  // done.
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(case_list() As BTCase)
		  // Created 4/19/2011 by Andrew Keller
		  
		  // Basic constructor.
		  
		  p_cases = case_list
		  
		  // done.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Item(index As Integer) As BTCase
		  // Created 4/19/2011 by Andrew Keller
		  
		  // Returns a reference to the given item.
		  
		  // Raises an OutOfBoundsException if the given index is out of bounds.
		  
		  Return p_cases( index )
		  
		  // done.
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected p_cases() As BTCase
	#tag EndProperty


End Class
#tag EndClass
