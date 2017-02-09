<html>

<head>
<title>Employee Edited</title>
</head>

<body>
<?php 
$id = $_GET['id']; 

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

	if(empty($_POST['patchInput']))	{
		$data_missing[] = 'Patch';
	} else 	{
		$patch = trim($_POST['patchInput']);
	}


	if(empty($data_missing))	{
		
		require_once('mySqlConnect.php');
		
		$insertQuery = "UPDATE huawei_releaseView SET model='$model', releaseName='$releaseName', sourceName='$sourceName', imageName='$imageName', patch='$patch' WHERE id='$id'";
	
#		echo "$insertQuery <br/><br/>";

		$statement = mysqli_prepare($databaseConnection, $insertQuery);	
		mysqli_stmt_execute($statement);
		
		$affected_rows = mysqli_stmt_affected_rows($statement);
		if($affected_rows == 1)	{

			echo "Release <font color=\"red\">$releaseName</font> Updated! <br/><br/>";
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

<form action="http://localhost/submitEditedRelease.php?id=<?php echo $id ?>" method="post">

	<P>
		<b>Edit Release <font color="red"><?php echo "$releaseName"  ?> </font></b>
	</p>

	<p> Model:  <input type="text" name="modelInput" size="70" value="<?php echo $model ?>"/> </p>
	<p> Release:  <input type="text" name="releaseNameInput" size="30" value="<?php echo $releaseName ?>"/> </p>
	<p> Source:  <input type="text" name="sourceNameInput" size="70" value="<?php echo $sourceName ?>"/> </p>
	<p> Image:  <input type="text" name="imageNameInput" size="70" value="<?php echo $imageName ?>"/> </p>
	<p> Patch:  <input type="text" name="patchInput" size="70" value="<?php echo $patch ?>"/> </p>


	<p>	
		<input type="submit" name="submitButton" value="Update" />
	</p>
</form>


</body>

</html>
