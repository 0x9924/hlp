$SQLServer = "(local)\SQLEXPRESS"
$SQLDBName = "MyDBName"
$uid ="user"
$pwd = $myPasswird
$SqlQuery = "SELECT * from Table;"
$SqlConnection = New-Object System.Data.SqlClient.SqlConnection
$SqlConnection.ConnectionString = "Server = $SQLServer; Database = $SQLDBName; Integrated Security = False; User ID = $uid; Password = $pwd;"
$SqlCmd = New-Object System.Data.SqlClient.SqlCommand
$SqlCmd.CommandText = $SqlQuery
$SqlCmd.Connection = $SqlConnection
$SqlAdapter = New-Object System.Data.SqlClient.SqlDataAdapter
$SqlAdapter.SelectCommand = $SqlCmd
$DataSet = New-Object System.Data.DataSet
$SqlAdapter.Fill($DataSet)

$DataSet.Tables[0] | export-csv "C:\Users\user\outfile.csv" -notypeinformation
$SqlConnection.Close() 
