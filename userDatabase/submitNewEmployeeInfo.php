<html>

<head>
<title>New Employee Added</title>
</head>

<body>
<?php 

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
		
		$insertQuery = "INSERT INTO huawei_employees (employeeID, firstName, middleName, lastName) VALUES (?, ?, ?, ?)";



		$statement = mysqli_prepare($databaseConnection, $insertQuery);	
		mysqli_stmt_bind_param($statement, "ssss", $emp_ID, $f_Name, $m_Name, $l_Name );
		mysqli_stmt_execute($statement);
		
		$affected_rows = mysqli_stmt_affected_rows($statement);
		if($affected_rows == 1)	{

			echo "New Employee <font color=\"red\">$f_Name $m_Name $l_Name</font> Entered! <br/><br/>";
			mysqli_stmt_close($statement);
			mysqli_close($dataBaseConnection);

			$emp_ID = "";
			$f_Name = "";
			$m_Name = "";
			$l_Name = "";
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

<form action="http://localhost/submitNewEmployeeInfo.php" method = "post">

	<b>Add a New Employee</b>

	<p> Employee ID:  <input type="text" name="employeeIDInput" size="30" value="<?php echo $emp_ID ?>"/> </p>
	<p> First Name:  <input type="text" name="firstNameInput" size="30" value="<?php echo $f_Name ?>"/> </p>
	<p> Middle Name (optional):  <input type="text" name="middleNameInput" size="30" value="<?php echo $m_Name ?>"/> </p>
	<p> Last Name:  <input type="text" name="lastNameInput" size="30" value="<?php echo $l_Name ?>"/> </p>

	<p>	
		<input type="submit" name="submitButton" value="Submit" />
	</p>
</form>


</body>

</html>
