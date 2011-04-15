#tag Interface
Protected Interface MainWindowView
	#tag Method, Flags = &h0
		Sub c_EmbedWithin(containingWindow As Window, left As Integer=0, top As Integer=0, width As Integer=-1, height As Integer=-1)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function c_Visible() As Boolean
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub c_Visible(Assigns newValue As Boolean)
		  
		End Sub
	#tag EndMethod


End Interface
#tag EndInterface
