<html>

<head>
<title>New Project Added</title>
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


	if(empty($_POST['pathInput']))	{
		$data_missing[] = 'Path';
	} else 	{
		$path = trim($_POST['pathInput']);
	}

	if(empty($_POST['descriptionInput']))	{
		$data_missing[] = 'Description';
	} else 	{
		$description = trim($_POST['descriptionInput']);
	}

#	if(empty($_POST['patchesInput']))	{
#		$data_missing[] = 'Patches Info';
#	} else 	{
#		$patches = trim($_POST['patchesInput']);
#	}

	if(empty($_POST['cloneCommandInput']))	{
		$data_missing[] = 'Clone Command';
	} else 	{
		$cloneCommand = trim($_POST['cloneCommandInput']);
	}





	if(empty($data_missing))	{
		
		require_once('mySqlConnect.php');
		
		$insertQuery = "INSERT INTO huawei_projectRepo (releaseName, projectName, path, description,  cloneCommand) VALUES (?, ?, ?, ?, ?)";

		$statement = mysqli_prepare($databaseConnection, $insertQuery);	
		mysqli_stmt_bind_param($statement, "sssss", $releaseName, $projectName, $path, $description, $cloneCommand );
		mysqli_stmt_execute($statement);
		
		$affected_rows = mysqli_stmt_affected_rows($statement);
		if($affected_rows == 1)	{

			echo "New Project <font color=\"red\">$projectName</font> Entered! <br/><br/>";
			mysqli_stmt_close($statement);
			mysqli_close($dataBaseConnection);

			$releaseName = "";
			$projectName = "";
			$path = "";
			$description = "";
#			$patches = "";
			$cloneCommand = "";
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

<form action="http://10.122.38.71/submitNewProjectInfo.php" method="post">

	<b>Add a New Project</b>

	<p> Release Name:  <input type="text" name="releaseNameInput" size="30" value=""/> </p>
	<p> Project Name:  <input type="text" name="projectNameInput" size="30" value=""/> </p>
	<p> Path:  <input type="text" name="pathInput" size="70" value=""/> </p>
	<p> Description: </p>
	<p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea type="text" name="descriptionInput" rows="6" cols="70" value=""></textarea> </p>
	<p> Clone Command:  <input type="text" name="cloneCommandInput" size="70" value=""/> </p>


	<p>	
		<input type="submit" name="submitButton" value="Submit" />
	</p>
</form>


</body>

</html>
