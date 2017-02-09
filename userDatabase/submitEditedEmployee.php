<html>

<head>
<title>Employee Edited</title>
</head>

<body>
<?php 
$id = $_GET['id']; 

if(isset($_POST['submitButton']))	{

	$data_missing = array();
	
	if(empty($_POST['employeeIDInput']))	{
		$data_missing[] = 'Emplyee ID';
	} else 	{
		$emp_ID = trim($_POST['employeeIDInput']);
	}

	if(empty($_POST['firstNameInput']))	{
		$data_missing[] = 'First Name';
	} else 	{
		$f_Name = trim($_POST['firstNameInput']);
	}


	$m_Name = trim($_POST['middleNameInput']);

	if(empty($_POST['lastNameInput']))	{
		$data_missing[] = 'Last Name';
	} else 	{
		$l_Name = trim($_POST['lastNameInput']);
	}




	if(empty($data_missing))	{
		
		require_once('mySqlConnect.php');
		
		$insertQuery = "UPDATE huawei_employees SET employeeID='$emp_ID', firstName='$f_Name', middleName='$m_Name', LastName='$l_Name' WHERE id='$id'";
	
#		echo "$insertQuery <br/><br/>";

		$statement = mysqli_prepare($databaseConnection, $insertQuery);	
		mysqli_stmt_execute($statement);
		
		$affected_rows = mysqli_stmt_affected_rows($statement);
		if($affected_rows == 1)	{

			echo "Employee <font color=\"red\">$f_Name $m_Name $l_Name</font> Updated! <br/><br/>";
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

<form action="http://localhost/submitEditedEmployee.php?id=<?php echo $id ?>" method="post">

	<P>
		<b>Edit Employee <font color="red"><?php echo "$firstName $middleName $lastName"  ?> </font></b>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="http://localhost/displayExistingEmployee.php?id=<?php echo $id ?>" method="post">Disable Edit</a>
	</p>

	<p> Employee ID:  <input type="text" name="employeeIDInput" size="30" value="<?php echo $emp_ID ?> "/> </p>
	<p> First Name:  <input type="text" name="firstNameInput" size="30" value="<?php echo $f_Name ?> "/> </p>
	<p> Nick Name (optional):  <input type="text" name="middleNameInput" size="30" value="<?php echo $m_Name ?> "/> </p>
	<p> Last Name:  <input type="text" name="lastNameInput" size="30" value="<?php echo $l_Name ?> "/> </p>

	<p>	
		<input type="submit" name="submitButton" value="Update" />
	</p>
</form>


</body>

</html>
