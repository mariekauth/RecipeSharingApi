<%
strTables = "Food_Items,Tags,Cultures,MealTypes,Diet_Types,Recipe_Tags,Recipe_DietTypes,Recipes,Ingredients,Directions,TeamMembers"
tables = split(strTables, ",")
		
	Set Conn = Server.CreateObject("ADODB.Connection")
	Conn.Open Session("ConnectionString")
	
	
	response.write("<h1>Recipe Database Information</h1>")

	for each table in tables
		call showTable(table, Conn)
	next

	Conn.Close
	Set Conn = Nothing

sub showTable(tableName, Conn)
	response.write("<h2>" & tableName & "</h2>")
	sql = "SELECT * FROM [" & tableName & "]"
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