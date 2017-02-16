<html>

<head>
<title>New Image Added</title>
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

	if(empty($_POST['instructionInput']))	{
		$data_missing[] = 'instruction';
	} else 	{
		$instruction = trim($_POST['instructionInput']);
	}

	if(empty($_POST['tagInput']))	{
		$data_missing[] = 'Tag';
	} else 	{
		$tag = trim($_POST['tagInput']);
	}





	if(empty($data_missing))	{
		
		require_once('mySqlConnect.php');
		
		$insertQuery = "INSERT INTO huawei_releasedImages (name, description, instruction, tag) VALUES (?, ?, ?, ?)";



		$statement = mysqli_prepare($databaseConnection, $insertQuery);	
		mysqli_stmt_bind_param($statement, "ssss", $name, $description, $instruction, $tag );
		mysqli_stmt_execute($statement);
		
		$affected_rows = mysqli_stmt_affected_rows($statement);
		if($affected_rows == 1)	{

			echo "New Released Image <font color=\"red\">$name</font> Entered! <br/><br/>";
			mysqli_stmt_close($statement);
			mysqli_close($dataBaseConnection);

			$name = "";
			$description = "";
			$instruction = "";
			$tag = "";
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

<form action="http://10.122.38.71/submitNewReleasedImage.php" method="post">

	<b>Add a Released Image</b>

	<p> Name:  <input type="text" name="nameInput" size="30" value=""/> </p>
	<p> Description: </p>
	<p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea type="text" name="descriptionInput" rows="6" cols="70" value=""></textarea> </p>
	<p> Instruction: </p>
	<p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea type="text" name="instructionInput" rows="6" cols="70" value=""></textarea> </p>
	<p> Tag:  <input type="text" name="tagInput" size="70" value=""/> </p>


	<p>	
		<input type="submit" name="submitButton" value="Submit" />
	</p>
</form>


</body>

</html>
