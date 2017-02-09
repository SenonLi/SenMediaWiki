<html>

<head>
<title>New Project Added</title>
</head>

<body>
<?php 

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
	}

	if(empty($_POST['buildInstructionInput']))	{
		$data_missing[] = 'Build Instruction';
	} else 	{
		$buildInstruction = trim($_POST['buildInstructionInput']);
	}

	if(empty($_POST['locationInput']))	{
		$data_missing[] = 'Location';
	} else 	{
		$location = trim($_POST['locationInput']);
	}





	if(empty($data_missing))	{
		
		require_once('mySqlConnect.php');
		
		$insertQuery = "INSERT INTO huawei_sourceCodeRepo (name, description, buildInstruction, location) VALUES (?, ?, ?, ?)";



		$statement = mysqli_prepare($databaseConnection, $insertQuery);	
		mysqli_stmt_bind_param($statement, "ssss", $name, $description, $buildInstruction, $location );
		mysqli_stmt_execute($statement);
		
		$affected_rows = mysqli_stmt_affected_rows($statement);
		if($affected_rows == 1)	{

			echo "New Source Code Repo <font color=\"red\">$name</font> Entered! <br/><br/>";
			mysqli_stmt_close($statement);
			mysqli_close($dataBaseConnection);

			$name = "";
			$description = "";
			$buildInstruction = "";
			$location = "";
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

<form action="http://localhost/submitNewSourceCode.php" method="post">

	<b>Add a New Source Code Repo</b>

	<p> Name:  <input type="text" name="nameInput" size="30" value=""/> </p>
	<p> Description: </p>
	<p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea type="text" name="descriptionInput" rows="6" cols="70" value=""></textarea> </p>
	<p> Build Instruction: </p>
	<p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea type="text" name="buildInstructionInput" rows="6" cols="70" value=""></textarea> </p>
	<p> Location:  <input type="text" name="locationInput" size="70" value=""/> </p>


	<p>	
		<input type="submit" name="submitButton" value="Submit" />
	</p>
</form>


</body>

</html>
