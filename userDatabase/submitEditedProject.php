<html>

<head>
<title>Project Edited</title>
</head>

<body>
<?php 
$id = $_GET['id']; 

if(isset($_POST['submitButton']))	{

	$data_missing = array();
	

	if(empty($_POST['projectNameInput']))	{
		$data_missing[] = 'Project Name';
	} else 	{
		$projectName = trim($_POST['projectNameInput']);
	}

	if(empty($_POST['pathInput']))	{
		$data_missing[] = 'First Name';
	} else 	{
		$path = trim($_POST['pathInput']);
		$_path = str_replace(array('\\', "\0", "\n", "\r", "'", '"', "\x1a"), array('\\\\', '\\0', '\\n', '\\r', "\\'", '\\"', '\\Z'), $path);
	}


	if(empty($_POST['descriptionInput']))	{
		$data_missing[] = 'Description';
	} else 	{
		$description = trim($_POST['descriptionInput']);
		$_description = str_replace(array('\\', "\0", "\n", "\r", "'", '"', "\x1a"), array('\\\\', '\\0', '\\n', '\\r', "\\'", '\\"', '\\Z'), $description);
#		echo "description =$description<br/>, _description = $_description<br/>";
	}

	if(empty($_POST['cloneCommandInput']))	{
		$data_missing[] = 'Clone Command';
	} else 	{
		$cloneCommand = trim($_POST['cloneCommandInput']);
		$_cloneCommand = str_replace(array('\\', "\0", "\n", "\r", "'", '"', "\x1a"), array('\\\\', '\\0', '\\n', '\\r', "\\'", '\\"', '\\Z'), $cloneCommand);
	}




	if(empty($data_missing))	{
		
		require_once('mySqlConnect.php');
		
		$updateQuery = "UPDATE huawei_projectRepo SET projectName='$projectName', path='$_path', description='$_description', cloneCommand='$_cloneCommand' WHERE id='$id'";
#	$updateQuery = sprintf("UPDATE huawei_projectRepo SET projectName='$projectName', description='$description' WHERE id='$id'");	
#		echo "$updateQuery <br/><br/>";

		$statement = mysqli_prepare($databaseConnection, $updateQuery);	
		mysqli_stmt_execute($statement);
		
		$affected_rows = mysqli_stmt_affected_rows($statement);
		if($affected_rows == 1)	{

			echo "Project <font color=\"red\">$projectName</font> Updated! <br/><br/>";
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

<form action="http://localhost/submitEditedProject.php?id=<?php echo $id ?>" method="post">

	<P>
		<b>Edit Project <font color="red"><?php echo "$projectName"  ?> </font></b>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="http://localhost/displayExistingProject.php?id=<?php echo $id ?>" method="post">Disable Edit</a>
	</p>

	<p> Project Name:  <input type="text" name="projectNameInput" size="30" value="<?php echo $projectName ?>"/> </p>
	<p> Path:  <input type="text" name="pathInput" size="70" value="<?php echo $path ?>"/> </p>
	<p> Description:</p>
	<p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea type="text" name="descriptionInput" rows="6" cols="70"><?php echo $description ?></textarea> </p>
	<p> Clone Command:  <input type="text" name="cloneCommandInput" size="70" value="<?php echo $cloneCommand ?>"/> </p>


	<p>	
		<input type="submit" name="submitButton" value="Update" />
	</p>
</form>


</body>

</html>
