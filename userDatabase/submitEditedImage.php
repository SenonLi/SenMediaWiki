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

	if(empty($_POST['instructionInput']))	{
		$data_missing[] = 'Instruction';
	} else 	{
		$instruction = trim($_POST['instructionInput']);
		$_instruction = str_replace(array('\\', "\0", "\n", "\r", "'", '"', "\x1a"), array('\\\\', '\\0', '\\n', '\\r', "\\'", '\\"', '\\Z'), $instruction);
	}

	if(empty($_POST['tagInput']))	{
		$data_missing[] = 'Tag';
	} else 	{
		$tag = trim($_POST['tagInput']);
		$_tag = str_replace(array('\\', "\0", "\n", "\r", "'", '"', "\x1a"), array('\\\\', '\\0', '\\n', '\\r', "\\'", '\\"', '\\Z'), $tag);
	}



	if(empty($data_missing))	{
		
		require_once('mySqlConnect.php');
		
		$updateQuery = "UPDATE huawei_releasedImages SET name='$name', description='$_description', instruction='$_instruction', tag='$_tag' WHERE id='$id'";

#		echo "$updateQuery <br/><br/>";

		$statement = mysqli_prepare($databaseConnection, $updateQuery);	
		mysqli_stmt_execute($statement);
		
		$affected_rows = mysqli_stmt_affected_rows($statement);
		if($affected_rows == 1)	{

			echo "Image <font color=\"red\">$name</font> Updated! <br/><br/>";
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

<form action="http://10.122.38.71/submitEditedImage.php?id=<?php echo $id ?>" method="post">

	<P>
		<b>Edit Image <font color="red"><?php echo $name  ?> </font></b>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="http://10.122.38.71/displayExistingImage.php?id=<?php echo $id ?>" method="post">Disable Edit</a>
	</p>

	<p> Name:  <input type="text" name="nameInput" size="30" value="<?php echo $name ?>"/> </p>
	<p> Description:</p>
	<p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea type="text" name="descriptionInput" rows="4" cols="70"><?php echo $description ?></textarea> </p>
	<p> Instruction:</p>
	<p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea type="text" name="instructionInput" rows="10" cols="70"><?php echo $instruction ?></textarea> </p>
	<p> Tag:  <input type="text" name="tagInput" size="70" value="<?php echo $tag ?>"/> </p>


	<p>	
		<input type="submit" name="submitButton" value="Update" />
	</p>
</form>


</body>

</html>
