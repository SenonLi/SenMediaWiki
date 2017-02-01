<html>

<head>
<title>Source Code Repo Edited</title>
</head>

<body>
<?php 
$id = $_GET['id']; 

if(isset($_POST['submitButton']))	{

	$data_missing = array();

	if(empty($_POST['nameInput']))	{
		$data_missing[] = 'Name';
	} else 	{
		$name = trim($_POST['nameInput']);
	}

	if(empty($_POST['descriptionInput']))	{
		$data_missing[] = 'Description';
	} else 	{
		$description = trim($_POST['descriptionInput']);
		$_description = str_replace(array('\\', "\0", "\n", "\r", "'", '"', "\x1a"), array('\\\\', '\\0', '\\n', '\\r', "\\'", '\\"', '\\Z'), $description);
	}

	if(empty($_POST['buildInstructionInput']))	{
		$data_missing[] = 'Build Instruction';
	} else 	{
		$buildInstruction = trim($_POST['buildInstructionInput']);
		$_buildInstruction = str_replace(array('\\', "\0", "\n", "\r", "'", '"', "\x1a"), array('\\\\', '\\0', '\\n', '\\r', "\\'", '\\"', '\\Z'), $buildInstruction);
	}

	if(empty($_POST['locationInput']))	{
		$data_missing[] = 'Location';
	} else 	{
		$location = trim($_POST['locationInput']);
	}



	if(empty($data_missing))	{
		
		require_once('mySqlConnect.php');
		
		$updateQuery = "UPDATE huawei_sourceCodeRepo SET name='$name', description='$_description', buildInstruction='$_buildInstruction', location='$location' WHERE id='$id'";

#		echo "$updateQuery <br/><br/>";

		$statement = mysqli_prepare($databaseConnection, $updateQuery);	
		mysqli_stmt_execute($statement);
		
		$affected_rows = mysqli_stmt_affected_rows($statement);
		if($affected_rows == 1)	{

			echo "Source Code Repo <font color=\"red\">$name</font> Updated! <br/><br/>";
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

<form action="http://localhost/submitEditedSourceCode.php?id=<?php echo $id ?>" method="post">

	<P>
		<b>Edit Repo <font color="red"><?php echo $name  ?> </font></b>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="http://localhost/displayExistingSourceCode.php?id=<?php echo $id ?>" method="post">Disable Edit</a>
	</p>

	<p> Name:  <input type="text" name="nameInput" size="30" value="<?php echo $name ?>"/> </p>
	<p> Description:</p>
	<p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea type="text" name="descriptionInput" rows="6" cols="70"><?php echo $description ?></textarea> </p>
	<p> Build Instruction:</p>
	<p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea type="text" name="buildInstructionInput" rows="6" cols="70"><?php echo $buildInstruction ?></textarea> </p>
	<p> Location:  <input type="text" name="locationInput" size="70" value="<?php echo $location ?>"/> </p>


	<p>	
		<input type="submit" name="submitButton" value="Update" />
	</p>
</form>


</body>

</html>
