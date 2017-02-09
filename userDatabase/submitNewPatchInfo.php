<html>

<head>
<title>New Patch Added</title>
</head>

<body>
<?php 

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
	}



	if(empty($data_missing))	{
		
		require_once('mySqlConnect.php');
		
		$insertQuery = "INSERT INTO huawei_projectPatches (releaseName, projectName, patchName, description) VALUES (?, ?, ?, ?)";

		$statement = mysqli_prepare($databaseConnection, $insertQuery);	
		mysqli_stmt_bind_param($statement, "ssss", $releaseName, $projectName, $patchName, $description);
		mysqli_stmt_execute($statement);
		
		$affected_rows = mysqli_stmt_affected_rows($statement);
		if($affected_rows == 1)	{

			echo "New Patch <font color=\"red\">$patchName</font> Entered! <br/><br/>";
			mysqli_stmt_close($statement);
			mysqli_close($dataBaseConnection);

			$releaseName = "";
			$projectName = "";
			$patchName = "";
			$description = "";
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

<form action="http://localhost/submitNewPatchInfo.php" method="post">

	<b>Add a New Patch</b>

	<p> Release Name:  <input type="text" name="releaseNameInput" size="30" value=""/> </p>
	<p> Project Name:  <input type="text" name="projectNameInput" size="30" value=""/> </p>
	<p> Patch Name:  <input type="text" name="patchNameInput" size="30" value=""/> </p>
	<p> Description: </p>
	<p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea type="text" name="descriptionInput" rows="6" cols="70" value=""></textarea> </p>


	<p>	
		<input type="submit" name="submitButton" value="Submit" />
	</p>
</form>


</body>

</html>
