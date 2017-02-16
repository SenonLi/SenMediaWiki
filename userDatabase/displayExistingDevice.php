<html>
<head>
<title>Edit a Device</title>
</head>
<body>

<?php
$id = $_GET['id']; 

// Get a connection for the database
require_once('mySqlConnect.php');

// Create a query for the database
$employeeQuery = "SELECT deviceID, model, ownerID, ownerName FROM huawei_devices where id = '$id'";

#	echo "$employeeQuery";

// Get a response from the database by sending the connection
// and the query
$response = @mysqli_query($databaseConnection, $employeeQuery);

// If the query executed properly proceed
if($response){

	// mysqli_fetch_array will return a row of data from the query
	// until no further data is available
	while($row = mysqli_fetch_array($response))	{
		$deviceID = $row['deviceID']; 
		$model = $row['model']; 
		$ownerID = $row['ownerID']; 
		$ownerName = $row['ownerName']; 

	}


} else {
	echo "Couldn't issue database query<br />";
	echo mysqli_error($databaseConnection);
} 

// Close connection to the database
mysqli_close($databaseConnection);




#echo "user_name = $user_name <br/><br/>";

?>


<form  method="post">

	<P>
		<b>Edit a <font color="red"><?php echo "$model"  ?> </font> Device</b>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="http://10.122.38.71/editExistingDevice.php?id=<?php echo $id ?>" method="post">Enable Edit</a>
	</p>

	<p> Device ID:  <input disabled type="text" name="deviceIDInput" size="30" value="<?php echo $deviceID ?> "/> </p>
	<p> Model:  <input disabled type="text" name="modelInput" size="30" value="<?php echo $model ?> "/> </p>
	<p> Owner ID:  <input disabled type="text" name="ownerIDInput" size="30" value="<?php echo $ownerID ?> "/> </p>
	<p> Owner Name:  <input disabled type="text" name="ownerNameInput" size="30" value="<?php echo $ownerName ?> "/> </p>

</form>
</body>
</html>
