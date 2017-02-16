<?php

// Get a connection for the database
require_once('mySqlConnect.php');

// Create a query for the database
$sourceCodeQuery = "SELECT id, toolGroup, toolName, description, communityLicense, installationBinary, installInstruction FROM huawei_tools ORDER BY toolGroup, toolName";

#echo "$employeeQuery <br/><br/>";

// Get a response from the database by sending the connection
// and the query
$response = @mysqli_query($databaseConnection, $sourceCodeQuery);

// If the query executed properly proceed
if($response){

	echo '<link href="sourceCodeTableStyle.css" rel="stylesheet">';
	
	echo '<p><a href="http://10.122.38.71/addNewTool.php" target="_blank">Add a New Tool</a>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="http://10.122.38.71/getToolsInfo.php" >Disable Delete</a>
		</p>';

	// Draw the table
	echo '<table class="css-serial" align="left" cellspacing="0" cellpadding="10">
		<tr>
			<th align = "left">	<b>#</b> </th>		
			<th align = "left">	<b>Tool Group	</b> </th>		
			<th align = "left">	<b>Tool Name	</b> </th>		
			<th align = "left">	<b>Description  </b> </th>
		</tr>';

	// mysqli_fetch_array will return a row of data from the query
	// until no further data is available
	while($row = mysqli_fetch_array($response))	{

	    echo   '<tr>
			<td></td>
			<td align = "left">'. $row['toolGroup'] . '</td>
			<td align = "left"><a href="http://10.122.38.71/displayExistingTool.php?id=',urlencode($row["id"]),'" target="_blank" style="text-decoration:none">' . $row['toolName'] . '</a></td>
			<td align = "left"><textarea disabled type="text" name="descriptionInput" rows="3" cols="70">' . $row['description'] . '</textarea></td>
			<td align = "left"><a href="http://10.122.38.71/deleteTool.php?id=',urlencode($row["id"]),'" style="text-decoration:none, float:center">Delete</a></td>
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
