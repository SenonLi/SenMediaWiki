<html>
<head>
<title>Edit Project</title>
</head>
<body>

<?php
$id = $_GET['id']; 

// Get a connection for the database
require_once('mySqlConnect.php');

// Create a query for the database
$projectQuery = "SELECT name, description, buildInstruction, location FROM huawei_sourceCodeRepo WHERE id='$id' ORDER BY name";

#	echo "$projectQuery";

// Get a response from the database by sending the connection
// and the query
$response = @mysqli_query($databaseConnection, $projectQuery);

// If the query executed properly proceed
if($response){

	// mysqli_fetch_array will return a row of data from the query
	// until no further data is available
	while($row = mysqli_fetch_array($response))	{
		$name = $row['name']; 
		$description = $row['description']; 
		$buildInstruction = $row['buildInstruction']; 
		$location = $row['location']; 

	}
	
#	echo "$description <br/><br/>";

} else {
	echo "Couldn't issue database query<br />";
	echo mysqli_error($databaseConnection);
} 

// Close connection to the database
mysqli_close($databaseConnection);




#echo "user_name = $user_name <br/><br/>";

?>


<form action="http://10.122.38.71/submitEditedSourceCode.php?id=<?php echo $id ?>" method="post">

	<P>
		<b>Edit Repo <font color="red"><?php echo "$name"  ?> </font></b>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="http://10.122.38.71/displayExistingSourceCode.php?id=<?php echo $id ?>" method="post">Disable Edit</a>
	</p>

	<p> Source Name:  <input type="text" name="nameInput" size="30" value="<?php echo $name ?>"/> </p>
	<p> Description: </p>
	<p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea type="text" name="descriptionInput" rows="6" cols="70"><?php echo $description ?></textarea> </p>
	<p> Build Instruction: </p>
	<p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea type="text" name="buildInstructionInput" rows="6" cols="70"><?php echo $buildInstruction ?></textarea> </p>
	<p> Location:  <input type="text" name="locationInput" size="70" value="<?php echo $location ?>"/> </p>

	<p>	
		<input type="submit" name="submitButton" value="Update" />
	</p>

</form>
</body>
</html>
