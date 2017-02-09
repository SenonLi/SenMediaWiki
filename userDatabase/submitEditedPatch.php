<html>

<head>
<title>Project Edited</title>
</head>

<body>
<?php 
$id = $_GET['id']; 

if(isset($_POST['submitButton']))	{

	$data_missing = array();
	
	if(empty($_POST['releaseNameInput']))	{
		$data_missing[] = 'Release Name';
	} else 	{
		$releaseName = trim($_POST['releaseNameInput']);
	}

	if(empty($_POST['projectNameInput']))	{
		$data_missing[] = 'Project Name';
	} else 	{
		$projectName = trim($_POST['projectNameInput']);
	}

	if(empty($_POST['patchNameInput']))	{
		$data_missing[] = 'Patch Name';
	} else 	{
		$patchName = trim($_POST['patchNameInput']);
	}


	if(empty($_POST['descriptionInput']))	{
		$data_missing[] = 'Description';
	} else 	{
		$description = trim($_POST['descriptionInput']);
		$_description = str_replace(array('\\', "\0", "\n", "\r", "'", '"', "\x1a"), array('\\\\', '\\0', '\\n', '\\r', "\\'", '\\"', '\\Z'), $description);
#		echo "description =$description<br/>, _description = $_description<br/>";
	}



	if(empty($data_missing))	{
		
		require_once('mySqlConnect.php');
		
		$updateQuery = "UPDATE huawei_projectPatches SET releaseName='$releaseName', projectName='$projectName', patchName='$patchName', description='$_description' WHERE id='$id'";

#	$updateQuery = sprintf("UPDATE huawei_projectRepo SET projectName='$projectName', description='$description' WHERE id='$id'");	
#		echo "$updateQuery <br/><br/>";

		$statement = mysqli_prepare($databaseConnection, $updateQuery);	
		mysqli_stmt_execute($statement);
		
		$affected_rows = mysqli_stmt_affected_rows($statement);
		if($affected_rows == 1)	{

			echo "Patch <font color=\"red\">$patchName</font> Updated! <br/><br/>";
			mysqli_stmt_close($statement);
			mysqli_close($dataBaseConnection);

		} else if ($affected_rows == 0)	{
			echo "<font color=\"red\">No info changed.</font><br/><br/>";
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

<form action="http://localhost/submitEditedPatch.php?id=<?php echo $id ?>" method="post">

	<P>
		<b>Edit Patch <font color="red"><?php echo "$patchName"  ?> </font></b>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="http://localhost/displayExistingPatch.php?id=<?php echo $id ?>" method="post">Disable Edit</a>
	</p>

	<p> Release Name:  <input type="text" name="releaseNameInput" size="30" value="<?php echo $releaseName ?>"/> </p>
	<p> Project Name:  <input type="text" name="projectNameInput" size="30" value="<?php echo $projectName ?>"/> </p>
	<p> Patch Name:  <input type="text" name="patchNameInput" size="30" value="<?php echo $patchName ?>"/> </p>
	<p> Description: </p>
	<p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea type="text" name="descriptionInput" rows="6" cols="70"><?php echo $description ?></textarea> </p>

	<p>	
		<input type="submit" name="submitButton" value="Update" />
	</p>
</form>


</body>

</html>
