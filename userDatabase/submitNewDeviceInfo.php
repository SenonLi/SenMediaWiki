<html>

<head>
<title>New Device Added</title>
</head>

<body>
<?php 

if(isset($_POST['submitButton']))	{

	$data_missing = array();

	if(empty($_POST['deviceIDInput']))	{
		$data_missing[] = 'Device ID';
	} else 	{
		$deviceID = trim($_POST['deviceIDInput']);
	}

	if(empty($_POST['modelInput']))	{
		$data_missing[] = 'Model';
	} else 	{
		$model = trim($_POST['modelInput']);
	}

	if(empty($_POST['ownerIDInput']))	{
		$data_missing[] = 'Owner ID';
	} else 	{
		$ownerID = trim($_POST['ownerIDInput']);
	}


	if(empty($_POST['ownerNameInput']))	{
		$data_missing[] = 'Owner Name';
	} else 	{
		$ownerName = trim($_POST['ownerNameInput']);
	}





	if(empty($data_missing))	{
		
		require_once('mySqlConnect.php');
		
		$insertQuery = "INSERT INTO huawei_devices (deviceID, model, ownerID, ownerName) VALUES (?, ?, ?, ?)";



		$statement = mysqli_prepare($databaseConnection, $insertQuery);	
		mysqli_stmt_bind_param($statement, "ssss", $deviceID, $model, $ownerID, $ownerName );
		mysqli_stmt_execute($statement);
		
		$affected_rows = mysqli_stmt_affected_rows($statement);
		if($affected_rows == 1)	{

			echo "New Device <font color=\"red\">$model</font> Entered! <br/><br/>";
			mysqli_stmt_close($statement);
			mysqli_close($dataBaseConnection);

			$deviceID = "";
			$model = "";
			$ownerID = "";
			$ownerName = "";
		} else {

			echo 'Error Occurred <br />';
			echo mysqli_error($statement);
			
			printf("affected_rows = %d. \n", $affected_rows);

			mysqli_stmt_close($statement);
			mysqli_close($dataBaseConnection);
		}

	} else {
		echo "You <font color=\"red\"> Need to Enter </font> the following data: <br />";

		foreach($data_missing as $missing)	{
		
			echo "$missing <br />";
		}
		echo "<br /><br />";

	}
} else 		echo 'No Set of submitButton ! <br /> <br />';


?>

<form action="http://localhost/submitNewDeviceInfo.php" method = "post">

	<b>Add a New Device</b>

	<p> Device ID:  <input type="text" name="deviceIDInput" size="30" value="<?php echo $deviceID ?>"/> </p>
	<p> Model:  <input type="text" name="modelInput" size="30" value="<?php echo $model ?>"/> </p>
	<p> Owner ID:  <input type="text" name="ownerIDInput" size="30" value="<?php echo $ownerID ?>"/> </p>
	<p> Owner Name:  <input type="text" name="ownerNameInput" size="30" value="<?php echo $ownerName ?>"/> </p>

	<p>	
		<input type="submit" name="submitButton" value="Submit" />
	</p>
</form>


</body>

</html>
