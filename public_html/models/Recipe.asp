<%
class Recipe {
    Private id
    Private recipeName
    
    Private ingredients
    Private directions
    Private tags
    Private dietTypes

	Public Function Collection()
		set Collection = Server.CreateObject("Scripting.Dictionary")
	End Function
}
%>