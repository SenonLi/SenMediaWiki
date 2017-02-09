<?php
// Get a connection for the database
require_once('mySqlConnect.php');

// Create a query for the database
$sourceCodeQuery = "SELECT id, name, description, instruction, tag FROM huawei_releasedImages ORDER BY name";

#echo "$employeeQuery <br/><br/>";

// Get a response from the database by sending the connection
// and the query
$response = @mysqli_query($databaseConnection, $sourceCodeQuery);

// If the query executed properly proceed
if($response){

	echo '<link href="sourceCodeTableStyle.css" rel="stylesheet">';
	
	echo '<p><a href="http://localhost/addNewReleasedImage.php" target="_blank">New Released Image</a>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="http://localhost/getImageInfoDelete.php" >Enable Delete</a>
		</p><br/>';

	// Draw the table
	echo '<table class="hover" align="left" cellspacing="0" cellpadding="10">
		<tr>
			<td align = "left">	<b>Name	</b> </td>		
			<td align = "left">	<b>Description  </b> </td>
		</tr>';

	// mysqli_fetch_array will return a row of data from the query
	// until no further data is available
	while($row = mysqli_fetch_array($response))	{

	    echo   '<tr>
			<td align = "left"><a href="http://localhost/displayExistingImage.php?id=',urlencode($row["id"]),'" target="_blank" style="text-decoration:none">' . $row['name'] . '</a></td>
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
