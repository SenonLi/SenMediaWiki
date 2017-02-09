<?php
$releaseName = $_GET['releaseName']; 

// Get a connection for the database
require_once('mySqlConnect.php');

// Create a query for the database
$sourceCodeQuery = "SELECT id, projectName, path, description, cloneCommand FROM huawei_projectRepo WHERE releaseName = '$releaseName' ORDER BY projectName";

#echo "$employeeQuery <br/><br/>";

// Get a response from the database by sending the connection
// and the query
$response = @mysqli_query($databaseConnection, $sourceCodeQuery);

// If the query executed properly proceed
if($response){

	echo '<link href="sourceCodeTableStyle.css" rel="stylesheet">';
	
	echo '<p><a href="http://localhost/addNewProject.php" target="_blank">New Project</a>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="http://localhost/displayProjectsByReleaseDelete.php?releaseName=' . $releaseName . '" >Enable Delete</a>
		</p>';

	echo '<p>Projects Under Release <font color="red">' . $releaseName . '</font> </a>
		</p>';

	// Draw the table
	echo '<table class="css-serial" align="left" cellspacing="0" cellpadding="10">
		<tr>
			<th align = "left">	<b>#</b> </th>		
			<th align = "left">	<b>Project Name	</b> </th>		
			<th align = "left">	<b>Description  </b> </th>
		</tr>';

	// mysqli_fetch_array will return a row of data from the query
	// until no further data is available
	while($row = mysqli_fetch_array($response))	{

	    echo   '<tr>
			<td></td>
			<td align = "left"><a href="http://localhost/displayExistingProject.php?id=',urlencode($row["id"]),'" target="_blank" style="text-decoration:none">' . $row['projectName'] . '</a></td>
			<td align = "left"><textarea disabled type="text" name="descriptionInput" rows="5" cols="70">' . $row['description'] . '</textarea></td>
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
