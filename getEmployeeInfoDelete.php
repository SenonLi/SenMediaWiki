<?php
// Get a connection for the database
require_once('mySqlConnect.php');

// Create a query for the database
$employeeQuery = "SELECT id, employeeID, CONCAT_WS(\" \", firstName, middleName, lastName) AS 'wholeName' FROM huawei_employees ORDER BY employeeID";

#echo "$employeeQuery <br/><br/>";

// Get a response from the database by sending the connection
// and the query
$response = @mysqli_query($databaseConnection, $employeeQuery);

// If the query executed properly proceed
if($response){

	echo '<link href="employeeTableStyle.css" rel="stylesheet">';
	
	echo '<p><a href="http://192.168.1.61/addNewEmployee.php" target="_blank">Add a New Employee</a>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="http://192.168.1.61/getEmployeeInfo.php" >Disable Delete</a>
		</p><br/>';


	// Draw the table
	echo '<table class="hover" align="left" border="1" cellspacing="0" cellpadding="10">
		<tr>
			<td align = "left">	<b>Employee ID	</b> </td>		
			<td align = "left">	<b>Employee Name  </b> </td>
			<td align = "left">	<b>Remove Employee </b> </td>	
		</tr>';



	// mysqli_fetch_array will return a row of data from the query
	// until no further data is available
	while($row = mysqli_fetch_array($response))	{

	    echo   '<tr>
			<td align = "left"><a href="http://192.168.1.61/editExistingEmployee.php?id=',urlencode($row["id"]),'" target="_blank" style="text-decoration:none">' . $row['employeeID'] . '</a></td>
			<td align = "left">' . $row['wholeName'] . '</td>
			<td align = "left"><a href="http://192.168.1.61/deleteEmployee.php?id=',urlencode($row["id"]),'" style="text-decoration:none, float:center">Delete</a></td>
		   </tr>';
	}

	echo '</table>';

} else {

	echo "Couldn't issue database query<br />";

	echo mysqli_error($databaseConnection);

} 

// Close connection to the database
mysqli_close($databaseConnection);

?>
