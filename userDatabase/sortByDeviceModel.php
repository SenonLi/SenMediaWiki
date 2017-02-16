<?php
// Get a connection for the database
require_once('mySqlConnect.php');

$model = $_GET['model']; 

// Create a query for the database
$employeeQuery = "SELECT e.id AS empID, d.id AS devID, d.ownerID, d.deviceID, CONCAT_WS(\" \", e.firstName, e.middleName, e.lastName) AS 'ownerName' FROM huawei_employees e JOIN huawei_devices d ON e.employeeID = d.ownerID WHERE d.model = '$model' ORDER BY d.deviceID";


#echo "$employeeQuery <br/><br/>";

// Get a response from the database by sending the connection
// and the query
$response = @mysqli_query($databaseConnection, $employeeQuery);

// If the query executed properly proceed
if($response){

	echo '<link href="employeeTableStyle.css" rel="stylesheet">';

	echo '<p><a href="http://10.122.38.71/addNewDevice.php" target="_blank">Add a New Device</a>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="http://10.122.38.71/sortByDeviceModelDelete.php?model='. $model .'" >Enable Delete</a>
		</p><br/>';

	// Draw the table
	echo '<table class="hover" align="left" border="1" cellspacing="0" cellpadding="10">
		<tr>
			<td align = "left">	<b>Model  </b> </td>
			<td align = "left">	<b>Device ID	</b> </td>		
			<td align = "left">	<b>Owner ID  </b> </td>
			<td align = "left">	<b>Owner Name  </b> </td>
		</tr>';



	// mysqli_fetch_array will return a row of data from the query
	// until no further data is available
	while($row = mysqli_fetch_array($response))	{

	    echo   '<tr>
			<td align = "left">' . $model . '</td>
			<td align = "left"><a href="http://10.122.38.71/displayExistingDevice.php?id=',urlencode($row["devID"]),'" target="_blank" style="text-decoration:none">' . $row['deviceID'] . '</a></td>
			<td align = "left"><a href="http://10.122.38.71/displayExistingEmployee.php?id=',urlencode($row["empID"]),'" target="_blank" style="text-decoration:none">' . $row['ownerID'] . '</a></td>
			<td align = "left"><a href="http://10.122.38.71/sortByOwnerName.php?id=',urlencode($row["empID"]),'" style="text-decoration:none">' . $row['ownerName'] . '</a></td>

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
