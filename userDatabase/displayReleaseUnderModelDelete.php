<?php
// Get a connection for the database
require_once('mySqlConnect.php');

$model = $_GET['model']; 

// Create a query for the database
$employeeQuery = "SELECT r.id, r.releaseName, r.sourceName, r.imageName, r.patch, (select COUNT(p.releaseName) from huawei_projectRepo p where p.releaseName=r.releaseName) as 'total' FROM huawei_releaseView r WHERE r.model = '$model' ORDER BY r.releaseName";

#$employeeQuery = "SELECT id, releaseName, sourceName, imageName, patch FROM huawei_releaseView WHERE model = '$model' ORDER BY releaseName";


#echo "$employeeQuery <br/><br/>";

// Get a response from the database by sending the connection
// and the query
$response = @mysqli_query($databaseConnection, $employeeQuery);

// If the query executed properly proceed
if($response){

	echo '<link href="sourceCodeTableStyle.css" rel="stylesheet">';

	echo '<p><a href="http://localhost/addNewRelease.php" target="_blank">Add a New Release</a>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="http://localhost/displayReleaseUnderModel.php?model='. $model .'" >Disable Delete</a>
		</p>';
	echo '<p> Sort by model <font color="red">'. $model .'</p>';

	// Draw the table
	echo '<table class="css-serial" align="left" border="1" cellspacing="0" cellpadding="10">
		<tr>
			<th align = "left">	<b>#</b> </th>
			<td align = "left">	<b>Release	</b> </td>		
			<td align = "left">	<b>Source  </b> </td>
			<td align = "left">	<b>Image  </b> </td>
			<td align = "left">	<b>Projects  </b> </td>
			<td align = "left">	<b>Remove  </b> </td>
		</tr>';



	// mysqli_fetch_array will return a row of data from the query
	// until no further data is available
	while($row = mysqli_fetch_array($response))	{

	    echo   '<tr>
			<td align = "left"></td>
			<td align = "left"><a href="http://localhost/editExistingRelease.php?id=',urlencode($row["id"]),'" target="_blank" style="text-decoration:none">' . $row['releaseName'] . '</a></td>
			<td align = "left"><a href="http://localhost/displaySourceByName.php?name=',urlencode($row["sourceName"]),'" target="_blank" style="text-decoration:none">' . $row['sourceName'] . '</a></td>
			<td align = "left"><a href="http://localhost/displayImageByName.php?name=',urlencode($row["imageName"]),'" target="_blank" style="text-decoration:none">' . $row['imageName'] . '</a></td>
			<td align = "left"><a href="http://localhost/displayProjectsByRelease.php?releaseName=',urlencode($row["releaseName"]),'" target="_blank" style="text-decoration:none">Total: &nbsp;&nbsp; ' . $row['total'] . '</a></td>

			<td align = "left"><a href="http://localhost/deleteRelease.php?id=',urlencode($row["id"]),'" style="text-decoration:none, float:center">Delete</a></td>

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
