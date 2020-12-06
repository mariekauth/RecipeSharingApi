<%
response.write("<h1>TeamMembers</h1>")
	response.write("<h2>Remote - Info</h1>")
	tCatalog = "owebpro_recipe"
	tServerName = "198.71.225.146"
	tUserName = "RecipeAPI"
	tPassword = "Z00$recQ1@n"
			
	Set Conn = Server.CreateObject("ADODB.Connection")
	Conn.Open Session("ConnectionString")
	
	sql = "SELECT * FROM TeamMembers ORDER BY [Id];"
	SET rs = Conn.Execute(sql)
	
	response.write("<table border=""1"" style=""border:1px solid black;"">")
		response.write("<tr>")
			response.write("<td style=""font-weight:bold;"">")
				response.write("Id")
			response.write("</td>")
			response.write("<td style=""font-weight:bold;"">")
				response.write("FirstName")
			response.write("</td>")
			response.write("<td style=""font-weight:bold;"">")
				response.write("LastName")
			response.write("</td>")
		response.write("</tr>")
		
	while not rs.eof
		response.write("<tr>")
			response.write("<td>")
				response.write(rs("Id"))
			response.write("</td>")
			response.write("<td>")
				response.write(rs("FirstName"))
			response.write("</td>")
			response.write("<td>")
				response.write(rs("LastName"))
			response.write("</td>")
		response.write("</tr>")	
		rs.movenext
	wend
	SET rs = Nothing
	
	response.write("</table>")	
	

	sql = "SELECT * FROM sysobjects WHERE type = 'U';"
	Set rs = Conn.Execute(sql)
	If not rs.eof Then
		response.write("<h3>Tables</h3>")
		response.write("<dl>")
		while not rs.eof
			response.write("<dt>" & rs("name") & "</dt>")
			response.write("<dd>id: " & rs("id") & "</dd>")
			response.write("<dd>crdate: " & rs("crdate") & "</dd>")
			response.write("<dd>refdate: " & rs("refdate") & "</dd>")
			rs.movenext
		wend
		response.write("</dl>")
	End If
	Set rs = Nothing
	
	sql = "SELECT * FROM sysobjects WHERE type = 'V';"
	Set rs = Conn.Execute(sql)
	If not rs.eof Then
		response.write("<h3>Views</h3>")
		response.write("<dl>")
		while not rs.eof
			response.write("<dt>" & rs("name") & "</dt>")
			response.write("<dd>id: " & rs("id") & "</dd>")
			response.write("<dd>crdate: " & rs("crdate") & "</dd>")
			response.write("<dd>refdate: " & rs("refdate") & "</dd>")
			rs.movenext
		wend
		response.write("</dl>")
	End If
	Set rs = Nothing
	
	sql = "SELECT * FROM sysobjects WHERE type = 'P';"
	Set rs = Conn.Execute(sql)
	If not rs.eof Then
		response.write("<h3>Stored Procedures</h3>")
		response.write("<dl>")
		while not rs.eof
			response.write("<dt>" & rs("name") & "</dt>")
			response.write("<dd>id: " & rs("id") & "</dd>")
			response.write("<dd>crdate: " & rs("crdate") & "</dd>")
			response.write("<dd>refdate: " & rs("refdate") & "</dd>")
			rs.movenext
		wend
		response.write("</dl>")
	End If
	Set rs = Nothing
	
	sql = "SELECT * FROM sysobjects WHERE type = 'K';"
	Set rs = Conn.Execute(sql)
	If not rs.eof Then
		response.write("<h3>Primary Keys</h3>")
		response.write("<dl>")
		while not rs.eof
			response.write("<dt>" & rs("name") & "</dt>")
			response.write("<dd>id: " & rs("id") & "</dd>")
			response.write("<dd>parent_obj: " & rs("parent_obj") & "</dd>")
			response.write("<dd>crdate: " & rs("crdate") & "</dd>")
			response.write("<dd>refdate: " & rs("refdate") & "</dd>")
			rs.movenext
		wend
		response.write("</dl>")
	End If
	Set rs = Nothing
	
	sql = "SELECT * FROM sysobjects WHERE type = 'D';"
	Set rs = Conn.Execute(sql)
	If not rs.eof Then
		response.write("<h3>Defaults</h3>")
		response.write("<dl>")
		while not rs.eof
			response.write("<dt>" & rs("name") & "</dt>")
			response.write("<dd>id: " & rs("id") & "</dd>")
			response.write("<dd>parent_obj: " & rs("parent_obj") & "</dd>")
			response.write("<dd>crdate: " & rs("crdate") & "</dd>")
			response.write("<dd>refdate: " & rs("refdate") & "</dd>")
			rs.movenext
		wend
		response.write("</dl>")
	End If
	Set rs = Nothing
	
	sql = "SELECT * FROM sysobjects WHERE type = 'FN';"
	Set rs = Conn.Execute(sql)
	If not rs.eof Then
		response.write("<h3>Functions</h3>")
		response.write("<dl>")
		while not rs.eof
			response.write("<dt>" & rs("name") & "</dt>")
			response.write("<dd>id: " & rs("id") & "</dd>")
			response.write("<dd>crdate: " & rs("crdate") & "</dd>")
			response.write("<dd>refdate: " & rs("refdate") & "</dd>")
			rs.movenext
		wend
		response.write("</dl>")
	End If
	Set rs = Nothing
	
	Conn.Close
	Set Conn = Nothing
%>