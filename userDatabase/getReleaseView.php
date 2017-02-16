<?php
// Get a connection for the database
require_once('mySqlConnect.php');

// Create a query for the database
$employeeQuery = "SELECT DISTINCT model FROM huawei_releaseView ORDER BY model";

#echo "$employeeQuery <br/><br/>";

// Get a response from the database by sending the connection
// and the query
$response = @mysqli_query($databaseConnection, $employeeQuery);

// If the query executed properly proceed
if($response){

	echo '<link href="sourceCodeTableStyle.css" rel="stylesheet">';
	
	echo '<p><a href="http://10.122.38.71/addNewRelease.php" target="_blank">Add a New Release</a>
		</p>';

	echo '<p>Check releases by selecting a model:
		</p>';

	// Draw the table
	echo '<table class="css-serial" align="left" border="1" cellspacing="0" cellpadding="10">
		<thead><tr>
			<th align = "left">	<b>#</b> </th>		
			<th align = "left">	<b>Model Name	</b> </th>		
		</tr></thead><tbody>';

	// mysqli_fetch_array will return a row of data from the query
	// until no further data is available
	while($row = mysqli_fetch_array($response))	{

	    echo   '<tr>
			<td></td>
			<td align = "left"><a href="http://10.122.38.71/displayReleaseUnderModel.php?model=',urlencode($row["model"]),'" style="text-decoration:none">' . $row['model'] . '</a></td>
		   </tr>';
	}

	echo '</tbody></table>';

} else {

	echo "Couldn't issue database query<br />";

	echo mysqli_error($databaseConnection);

} 

// Close connection to the database
mysqli_close($databaseConnection);

?>
