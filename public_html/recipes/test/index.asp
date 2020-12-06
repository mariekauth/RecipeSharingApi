<!--#include virtual = "/Functions/SQLToJSON.inc"-->
<!--#include virtual = "/Functions/aspJSON.asp"--><%
Dim oJsCore
Dim oJSON

Set oJsCore = new jsCore
Set oJSON = New aspJSON

'[{"date":"2020-12-06T21:20:10.5970573-05:00","temperatureC":31,"temperatureF":87,"summary":"Hot"},{"date":"2020-12-07T21:20:10.6078443-05:00","temperatureC":16,"temperatureF":60,"summary":"Warm"},{"date":"2020-12-08T21:20:10.6078555-05:00","temperatureC":14,"temperatureF":57,"summary":"Balmy"},{"date":"2020-12-09T21:20:10.6078569-05:00","temperatureC":-9,"temperatureF":16,"summary":"Chilly"},{"date":"2020-12-10T21:20:10.6078575-05:00","temperatureC":14,"temperatureF":57,"summary":"Hot"}]

Set Conn = Server.CreateObject("ADODB.Connection")
Conn.Open Session("ConnectionString")

sql = "SELECT * FROM RecipeAPI.Recipes LEFT JOIN RecipeAPI.Ingredients ON RecipeAPI.Recipes.RecipeID = RecipeAPI.Ingredients.RecipeID LEFT JOIN RecipeAPI.Food_Items ON RecipeAPI.Ingredients.FoodItemsID = RecipeAPI.Food_Items.FoodItemsID LEFT JOIN RecipeAPI.Directions ON RecipeAPI.Recipes.RecipeID = RecipeAPI.Directions.RecipeID LEFT JOIN RecipeAPI.Recipe_Tags ON RecipeAPI.Recipes.RecipeID = RecipeAPI.Recipe_Tags.RecipeID LEFT JOIN Tags ON RecipeAPI.Recipe_Tags.TagID = RecipeAPI.Tags.TagID LEFT JOIN RecipeAPI.Recipe_DietTypes ON RecipeAPI.Recipes.RecipeID = RecipeAPI.Recipe_DietTypes.RecipeID LEFT JOIN RecipeAPI.Diet_Types ON RecipeAPI.Recipe_DietTypes.DietTypeID = RecipeAPI.Diet_Types.DietTypeID"

lastRecipeID = 0
json = "["
SET rs = Conn.Execute(sql)
	While Not rs.eof
		If lastRecipeID <> rs("RecipeAPI.Recipes.RecipeID") Then
			' Begin Add Recipe
			json = json & "{"

				json = json & """id"":" & rs("RecipeAPI.Recipes.RecipeID") & ","
				json = json & """name"":""" & rs("RecipeAPI.Recipes.RecipeName") & ""","

				'ingredients
				json = json & """Ingredients":"["
				json = json & "]"

			json = json & "}"
			' End Add Recipe
		End If
		lastRecipeID = rs("RecipeAPI.Recipes.RecipeID")
		rs.movenext
	Wend
SET rs = Nothing
json = json & "]"

' jsCore
' QueryToJSON(dbc, sql)

'json = oJsCore.QueryToJSON(Conn, sql)

call showRecipeAPITable(tableName, sql, Conn)

Conn.Close
Set Conn = Nothing

sub showRecipeAPITable(tableName, sql, Conn)
	response.write("<h2>" & tableName & "</h2>")
	SET rs = Conn.Execute(sql)
		If Not rs.eof Then
			response.write("<table border=""1"">")
				response.write("<tr>")
				for each f in  rs.fields
					response.write("<td>")
					response.write(f.name)
					response.write("</td>")
				next
				response.write("</tr>")
			While Not rs.eof
				response.write("<tr>")
				for each f in  rs.fields
					response.write("<td>")
					response.write(f.value)
					response.write("</td>")
				next
				response.write("</tr>")
				rs.MoveNext
			Wend
			response.write("</table>")
		End If
	SET rs = Nothing
end sub
%>