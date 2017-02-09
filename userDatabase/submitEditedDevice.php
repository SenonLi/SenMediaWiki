<html>

<head>
<title>Device Edited</title>
</head>

<body>
<?php 
$id = $_GET['id']; 

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
		
		$insertQuery = "UPDATE huawei_devices SET deviceID='$deviceID', model='$model', ownerID='$ownerID', ownerName='$ownerName' WHERE id='$id'";
	
#		echo "$insertQuery <br/><br/>";

		$statement = mysqli_prepare($databaseConnection, $insertQuery);	
		mysqli_stmt_execute($statement);
		
		$affected_rows = mysqli_stmt_affected_rows($statement);
		if($affected_rows == 1)	{

			echo "A <font color=\"red\">$model</font> Device Updated! <br/><br/>";
			mysqli_stmt_close($statement);
			mysqli_close($dataBaseConnection);

		} else if ($affected_rows == 0)	{
			echo "<font color=\"red\">No info changed.</font><br/>";
			mysqli_stmt_close($statement);
			mysqli_close($dataBaseConnection);
		}else {

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

<form action="http://localhost/submitEditedDevice.php?id=<?php echo $id ?>" method="post">

	<P>
		<b>Edit a <font color="red"><?php echo "$model"  ?> </font> Device</b>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="http://localhost/displayExistingDevice.php?id=<?php echo $id ?>" method="post">Disable Edit</a>
	</p>

	<p> Device ID:  <input type="text" name="deviceIDInput" size="30" value="<?php echo $deviceID ?> "/> </p>
	<p> Model:  <input type="text" name="modelInput" size="30" value="<?php echo $model ?> "/> </p>
	<p> Owner ID:  <input type="text" name="ownerIDInput" size="30" value="<?php echo $ownerID ?> "/> </p>
	<p> Owner Name:  <input type="text" name="ownerNameInput" size="30" value="<?php echo $ownerName ?> "/> </p>

	<p>	
		<input type="submit" name="submitButton" value="Update" />
	</p>
</form>


</body>

</html>
