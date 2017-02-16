<html>

<head>
<title>Source Code Repo Edited</title>
</head>

<body>
<?php 
$id = $_GET['id']; 

if(isset($_POST['submitButton']))	{

	$data_missing = array();

	if(empty($_POST['toolGroupInput']))	{
		$data_missing[] = 'Tool Group';
	} else 	{
		$toolGroup = trim($_POST['toolGroupInput']);
	}

	if(empty($_POST['toolNameInput']))	{
		$data_missing[] = 'Tool Name';
	} else 	{
		$toolName = trim($_POST['toolNameInput']);
	}

	if(empty($_POST['descriptionInput']))	{
		$data_missing[] = 'Description';
	} else 	{
		$description = trim($_POST['descriptionInput']);
		$_description = str_replace(array('\\', "\0", "\n", "\r", "'", '"', "\x1a"), array('\\\\', '\\0', '\\n', '\\r', "\\'", '\\"', '\\Z'), $description);
	}

	if(empty($_POST['communityLicenseInput']))	{
		$data_missing[] = 'Community License';
	} else 	{
		$communityLicense = trim($_POST['communityLicenseInput']);
	}

	if(empty($_POST['installationBinaryInput']))	{
		$data_missing[] = 'Installation Binary';
	} else 	{
		$installationBinary = trim($_POST['installationBinaryInput']);
	}

	if(empty($_POST['installInstructionInput']))	{
		$data_missing[] = 'Install Instruction';
	} else 	{
		$installInstruction = trim($_POST['installInstructionInput']);
	}



	if(empty($data_missing))	{
		
		require_once('mySqlConnect.php');
		
		$updateQuery = "UPDATE huawei_tools SET toolGroup='$toolGroup', toolName='$toolName', description='$_description', communityLicense='$communityLicense', installationBinary='$installationBinary', installInstruction='$installInstruction' WHERE id='$id'";

#		echo "$updateQuery <br/><br/>";

		$statement = mysqli_prepare($databaseConnection, $updateQuery);	
		mysqli_stmt_execute($statement);
		
		$affected_rows = mysqli_stmt_affected_rows($statement);
		if($affected_rows == 1)	{

			echo "Tool <font color=\"red\">$toolName</font> Updated! <br/><br/>";
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

<form action="http://10.122.38.71/submitEditedTool.php?id=<?php echo $id ?>" method="post">

	<P>
		<b>Edit Tool <font color="red"><?php echo $toolName  ?> </font></b>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="http://10.122.38.71/displayExistingTool.php?id=<?php echo $id ?>" method="post">Disable Edit</a>
	</p>

	<p> Tool Group:  <input type="text" name="toolGroupInput" size="30" value="<?php echo $toolGroup ?>"/> </p>
	<p> Tool Name:  <input type="text" name="toolNameInput" size="30" value="<?php echo $toolName ?>"/> </p>
	<p> Description: </p>
	<p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea type="text" name="descriptionInput" rows="6" cols="70" value=""><?php echo $description ?></textarea> </p>
	<p> Community License:  <input type="text" name="communityLicenseInput" size="70" value="<?php echo $communityLicense ?>"/> </p>
	<p> Installation Binary:  <input type="text" name="installationBinaryInput" size="70" value="<?php echo $installationBinary ?>"/> </p>
	<p> Install Instruction:  <input type="text" name="installInstructionInput" size="70" value="<?php echo $installInstruction ?>"/> </p>


	<p>	
		<input type="submit" name="submitButton" value="Update" />
	</p>
</form>


</body>

</html>
