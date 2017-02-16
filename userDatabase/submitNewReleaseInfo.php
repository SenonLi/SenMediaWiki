<html>

<head>
<title>New Release Added</title>
</head>

<body>
<?php 

if(isset($_POST['submitButton']))	{

	$data_missing = array();

	if(empty($_POST['modelInput']))	{
		$data_missing[] = 'Model';
	} else 	{
		$model = trim($_POST['modelInput']);
	}

	if(empty($_POST['releaseNameInput']))	{
		$data_missing[] = 'Release';
	} else 	{
		$releaseName = trim($_POST['releaseNameInput']);
	}

	if(empty($_POST['sourceNameInput']))	{
		$data_missing[] = 'Source';
	} else 	{
		$sourceName = trim($_POST['sourceNameInput']);
	}

	if(empty($_POST['imageNameInput']))	{
		$data_missing[] = 'Image';
	} else 	{
		$imageName = trim($_POST['imageNameInput']);
	}

#	if(empty($_POST['patchInput']))	{
#		$data_missing[] = 'Patch';
#	} else 	{
#		$patch = trim($_POST['patchInput']);
#	}




	if(empty($data_missing))	{
		
		require_once('mySqlConnect.php');
		
		$insertQuery = "INSERT INTO huawei_releaseView (model, releaseName, sourceName, imageName) VALUES (?, ?, ?, ?)";



		$statement = mysqli_prepare($databaseConnection, $insertQuery);	
		mysqli_stmt_bind_param($statement, "ssss", $model, $releaseName, $sourceName, $imageName );
		mysqli_stmt_execute($statement);
		
		$affected_rows = mysqli_stmt_affected_rows($statement);
		if($affected_rows == 1)	{

			echo "New Release <font color=\"red\">$releaseName</font> Entered! <br/><br/>";
			mysqli_stmt_close($statement);
			mysqli_close($dataBaseConnection);

			$model = "";
			$releaseName = "";
			$sourceName = "";
			$imageName = "";

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

<form action="http://10.122.38.71/submitNewReleaseInfo.php" method = "post">

	<b>Add a New Release</b>

	<p> Model:  <input type="text" name="modelInput" size="70" value="<?php echo $model ?>"/> </p>
	<p> Release Name:  <input type="text" name="releaseNameInput" size="30" value="<?php echo $releaseName ?>"/> </p>
	<p> Source Name:  <input type="text" name="sourceNameInput" size="70" value="<?php echo $sourceName ?>"/> </p>
	<p> Image Name:  <input type="text" name="imageNameInput" size="70" value="<?php echo $imageName ?>"/> </p>


	<p>	
		<input type="submit" name="submitButton" value="Submit" />
	</p>
</form>


</body>

</html>
