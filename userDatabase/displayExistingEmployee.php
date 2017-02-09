<html>
<head>
<title>Edit Employee</title>
</head>
<body>

<?php
$id = $_GET['id']; 

// Get a connection for the database
require_once('mySqlConnect.php');

// Create a query for the database
$employeeQuery = "SELECT employeeID, firstName, middleName, lastName FROM huawei_employees where id = '$id'";

#	echo "$employeeQuery";

// Get a response from the database by sending the connection
// and the query
$response = @mysqli_query($databaseConnection, $employeeQuery);

// If the query executed properly proceed
if($response){

	// mysqli_fetch_array will return a row of data from the query
	// until no further data is available
	while($row = mysqli_fetch_array($response))	{
		$employeeID = $row['employeeID']; 
		$firstName = $row['firstName']; 
		$middleName = $row['middleName']; 
		$lastName = $row['lastName']; 

	}


} else {
	echo "Couldn't issue database query<br />";
	echo mysqli_error($databaseConnection);
} 

// Close connection to the database
mysqli_close($databaseConnection);




#echo "user_name = $user_name <br/><br/>";

?>


<form method="post">

	<P>
		<b>Edit Employee <font color="red"><?php echo "$firstName $middleName $lastName"  ?> </font></b>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="http://localhost/editExistingEmployee.php?id=<?php echo $id ?>" method="post">Enable Edit</a>
	</p>

	<p> Employee ID:  <input disabled type="text" name="employeeIDInput" size="30" value="<?php echo $employeeID ?> "/> </p>
	<p> First Name:  <input disabled type="text" name="firstNameInput" size="30" value="<?php echo $firstName ?> "/> </p>
	<p> Nick Name (optional):  <input disabled type="text" name="middleNameInput" size="30" value="<?php echo $middleName ?> "/> </p>
	<p> Last Name:  <input disabled type="text" name="lastNameInput" size="30" value="<?php echo $lastName ?> "/> </p>

</form>
</body>
</html>
