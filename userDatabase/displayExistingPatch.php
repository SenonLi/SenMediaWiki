<?php
$id = $_GET['id']; 
#$releaseName = $_GET['releaseName']; 
#$projectName = $_GET['projectName']; 
#$patchName = $_GET['patchName']; 
// Get a connection for the database
require_once('mySqlConnect.php');

// Create a query for the database
$sourceCodeQuery = "SELECT id, releaseName, projectName, patchName, description FROM huawei_projectPatches WHERE id = '$id' ORDER BY projectName";

#echo "$employeeQuery <br/><br/>";

// Get a response from the database by sending the connection
// and the query
$response = @mysqli_query($databaseConnection, $sourceCodeQuery);

// If the query executed properly proceed
if($response){

	echo '<link href="sourceCodeTableStyle.css" rel="stylesheet">';

	// mysqli_fetch_array will return a row of data from the query
	// until no further data is available
	while($row = mysqli_fetch_array($response))	{
		$id = $row['id']; 
		$description = $row['description']; 
		$releaseName = $row['releaseName']; 
		$projectName = $row['projectName']; 
		$patchName = $row['patchName']; 
	}


} else {

	echo "Couldn't issue database query<br />";

	echo mysqli_error($databaseConnection);

} 

// Close connection to the database
mysqli_close($databaseConnection);

?>

<html>
<head>
<title>Display Patch</title>
</head>
<body>
<form method="post">

	<p>
		<a href="http://localhost/addNewPatch.php" target="_blank">Add New Patch</a>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="http://localhost/editExistingPatch.php?id=<?php echo $id ?>">Enable Edit</a>

	</p>

	<p> Release Name:  <input disabled type="text" name="releaseNameInput" size="30" value="<?php echo $releaseName ?>"/> </p>
	<p> Project Name:  <input disabled type="text" name="projectNameInput" size="30" value="<?php echo $projectName ?>"/> </p>
	<p> Patch Name:  <input disabled type="text" name="patchNameInput" size="30" value="<?php echo $patchName ?>"/> </p>
	<p> Description: </p>
	<p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea disabled type="text" name="descriptionInput" rows="5" cols="70"><?php echo $description ?></textarea> </p>


</form>
</body>
</html>

