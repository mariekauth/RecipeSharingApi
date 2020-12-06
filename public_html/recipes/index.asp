<%
Set Conn = Server.CreateObject("ADODB.Connection")
Conn.Open Session("ConnectionString")

sql = "SELECT * FROM RecipeAPI.Recipes LEFT JOIN RecipeAPI.Ingredients ON RecipeAPI.Recipes.RecipeID = RecipeAPI.Ingredients.RecipeID LEFT JOIN RecipeAPI.Food_Items ON RecipeAPI.Ingredients.FoodItemsID = RecipeAPI.Food_Items.FoodItemsID LEFT JOIN RecipeAPI.Directions ON RecipeAPI.Recipes.RecipeID = RecipeAPI.Directions.RecipeID LEFT JOIN RecipeAPI.Recipe_Tags ON RecipeAPI.Recipes.RecipeID = RecipeAPI.Recipe_Tags.RecipeID LEFT JOIN Tags ON RecipeAPI.Recipe_Tags.TagID = RecipeAPI.Tags.TagID LEFT JOIN RecipeAPI.Recipe_DietTypes ON RecipeAPI.Recipes.RecipeID = RecipeAPI.Recipe_DietTypes.RecipeID LEFT JOIN RecipeAPI.Diet_Types ON RecipeAPI.Recipe_DietTypes.DietTypeID = RecipeAPI.Diet_Types.DietTypeID"

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