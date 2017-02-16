<?php
// Get a connection for the database
require_once('mySqlConnect.php');

// Create a query for the database
$employeeQuery = "SELECT id, projectName, path, description, cloneCommand FROM huawei_projectRepo ORDER BY projectName";

#echo "$employeeQuery <br/><br/>";

// Get a response from the database by sending the connection
// and the query
$response = @mysqli_query($databaseConnection, $employeeQuery);

// If the query executed properly proceed
if($response){

	echo '<link href="sourceCodeTableStyle.css" rel="stylesheet">';
	
	echo '<p><a href="http://10.122.38.71/addNewProject.php" target="_blank">Add a New Project</a>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="http://10.122.38.71/getProjectReposDelete.php" >Enable Delete</a>
		</p><br/>';

	// Draw the table
	echo '<table class="css-serial" align="left" cellspacing="0" cellpadding="10">';

	// mysqli_fetch_array will return a row of data from the query
	// until no further data is available
	while($row = mysqli_fetch_array($response))	{

	    echo   '<tr>
			<td></td>
			<td align = "left"><a href="http://10.122.38.71/displayExistingProject.php?id=',urlencode($row["id"]),'" target="_blank" style="text-decoration:none">' . $row['projectName'] . '</a></td>
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
