<html>
<head>
<title>Edit Image</title>
</head>
<body>

<?php
$id = $_GET['id']; 

// Get a connection for the database
require_once('mySqlConnect.php');

// Create a query for the database
$projectQuery = "SELECT name, description, instruction, tag FROM huawei_releasedImages WHERE id='$id' ORDER BY name";

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
		$instruction = $row['instruction']; 
		$tag = $row['tag']; 

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


<form method="post">

	<P>
		<b>Edit Image <font color="red"><?php echo "$name"  ?> </font></b>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="http://10.122.38.71/editExistingImage.php?id=<?php echo $id ?>" method="post">Enable Edit</a>
	</p>

	<p> Name:  <input disabled type="text" name="nameInput" size="30" value="<?php echo $name ?>"/> </p>
	<p> Description: </p>
	<p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea disabled type="text" name="descriptionInput" rows="4" cols="70"><?php echo $description ?></textarea> </p>
	<p> Instruction: </p>
	<p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea disabled type="text" name="instructionInput" rows="10" cols="70"><?php echo $instruction ?></textarea> </p>
	<p> Path:  <input disabled type="text" name="tagInput" size="70" value="<?php echo $tag ?>"/> </p>


</form>
</body>
</html>
