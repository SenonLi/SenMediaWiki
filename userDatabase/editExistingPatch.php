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
$projectQuery = "SELECT releaseName, projectName, patchName, description FROM huawei_projectPatches WHERE id='$id' ORDER BY projectName";

#	echo "$projectQuery";

// Get a response from the database by sending the connection
// and the query
$response = @mysqli_query($databaseConnection, $projectQuery);

// If the query executed properly proceed
if($response){

	// mysqli_fetch_array will return a row of data from the query
	// until no further data is available
	while($row = mysqli_fetch_array($response))	{
		$releaseName = $row['releaseName'];
		$projectName = $row['projectName']; 
		$patchName = $row['patchName']; 
		$description = $row['description']; 
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


<form action="http://localhost/submitEditedPatch.php?id=<?php echo $id ?>" method="post">

	<P>
		<b>Edit Patch <font color="red"><?php echo "$patchName"  ?> </font></b>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="http://localhost/displayExistingPatch.php?id=<?php echo $id ?>" method="post">Disable Edit</a>
	</p>

	<p> Release Name:  <input type="text" name="releaseNameInput" size="30" value="<?php echo $releaseName ?>"/> </p>
	<p> Project Name:  <input type="text" name="projectNameInput" size="30" value="<?php echo $projectName ?>"/> </p>
	<p> Patch Name:  <input type="text" name="patchNameInput" size="30" value="<?php echo $patchName ?>"/> </p>
	<p> Description: </p>
	<p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea type="text" name="descriptionInput" rows="6" cols="70"><?php echo $description ?></textarea> </p>


	<p>	
		<input type="submit" name="submitButton" value="Update" />
	</p>
</form>
</body>
</html>
