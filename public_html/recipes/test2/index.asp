<%
Set Conn = Server.CreateObject("ADODB.Connection")
Conn.Open Session("ConnectionString")

'[{"date":"2020-12-06T21:20:10.5970573-05:00","temperatureC":31,"temperatureF":87,"summary":"Hot"},{"date":"2020-12-07T21:20:10.6078443-05:00","temperatureC":16,"temperatureF":60,"summary":"Warm"},{"date":"2020-12-08T21:20:10.6078555-05:00","temperatureC":14,"temperatureF":57,"summary":"Balmy"},{"date":"2020-12-09T21:20:10.6078569-05:00","temperatureC":-9,"temperatureF":16,"summary":"Chilly"},{"date":"2020-12-10T21:20:10.6078575-05:00","temperatureC":14,"temperatureF":57,"summary":"Hot"}]

Conn.Close
Set Conn = Nothing
%>