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
$employeeQuery = "SELECT model, releaseName, sourceName, imageName, patch FROM huawei_releaseView where id = '$id'";

#	echo "$employeeQuery";

// Get a response from the database by sending the connection
// and the query
$response = @mysqli_query($databaseConnection, $employeeQuery);

// If the query executed properly proceed
if($response){

	// mysqli_fetch_array will return a row of data from the query
	// until no further data is available
	while($row = mysqli_fetch_array($response))	{
		$model = $row['model']; 
		$releaseName = $row['releaseName']; 
		$sourceName = $row['sourceName']; 
		$imageName = $row['imageName']; 
		$patch = $row['patch']; 
	}


} else {
	echo "Couldn't issue database query<br />";
	echo mysqli_error($databaseConnection);
} 

// Close connection to the database
mysqli_close($databaseConnection);




#echo "user_name = $user_name <br/><br/>";

?>


<form action="http://localhost/submitEditedRelease.php?id=<?php echo $id ?>" method="post">

	<P>
		<b>Edit Release <font color="red"><?php echo "$releaseName"  ?> </font></b>
	</p>

	<p> Model:  <input type="text" name="modelInput" size="70" value="<?php echo $model ?>"/> </p>
	<p> Release:  <input type="text" name="releaseNameInput" size="30" value="<?php echo $releaseName ?>"/> </p>
	<p> Source:  <input type="text" name="sourceNameInput" size="70" value="<?php echo $sourceName ?>"/> </p>
	<p> Image:  <input type="text" name="imageNameInput" size="70" value="<?php echo $imageName ?>"/> </p>
	<p> Patch:  <input type="text" name="patchInput" size="70" value="<?php echo $patch ?>"/> </p>


	<p>	
		<input type="submit" name="submitButton" value="Update" />
	</p>
</form>
</body>
</html>
