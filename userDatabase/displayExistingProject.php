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
$projectQuery = "SELECT releaseName, projectName, path, description, cloneCommand FROM huawei_projectRepo WHERE id='$id' ORDER BY projectName";

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
		$path = $row['path']; 
		$description = $row['description']; 
#		$patches = $row['patches']; 
		$cloneCommand = $row['cloneCommand']; 

	}
	

	// Create a query for the database
	$patchesQuery = "SELECT id, patchName, description FROM huawei_projectPatches WHERE releaseName='$releaseName' AND projectName='$projectName' ORDER BY projectName";

	$patchesResult = @mysqli_query($databaseConnection, $patchesQuery);

	// If the query executed properly proceed
#	if($patchesResult){

#		// mysqli_fetch_array will return a row of data from the query
#		// until no further data is available
#		while($patchRow = mysqli_fetch_array($patchesResult))	{
#			$patchName = $patchRow['patchName']; 
#			$patchDescription = $patchRow['description']; 
#		}
#	
#	} else {
#		echo "Couldn't issue database query<br />";
#		echo mysqli_error($databaseConnection);
#	} 




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
	<link href="sourceCodeTableStyle.css" rel="stylesheet">
	<P>
		<b>Edit Project <font color="red"><?php echo "$projectName"  ?> </font></b>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="http://10.122.38.71/editExistingProject.php?id=<?php echo $id ?>" method="post">Enable Edit</a>
	</p>

	<p> Release Name:  <input disabled type="text" name="releaseNameInput" size="30" value="<?php echo $releaseName ?>"/> </p>
	<p> Project Name:  <input disabled type="text" name="projectNameInput" size="30" value="<?php echo $projectName ?>"/> </p>
	<p> Path:  <input disabled type="text" name="pathInput" size="70" value="<?php echo $path ?>"/> </p>
	<p> Clone Command:  <input disabled type="text" name="cloneCommandInput" size="70" value="<?php echo $cloneCommand ?>"/> </p>
	<p> Description: </p>
	<p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea disabled type="text" name="descriptionInput" rows="6" cols="70"><?php echo $description ?></textarea> </p>
	<p> Patches: </p>
	<dir style="width: 100%; ">
		<p><a href="http://10.122.38.71/addNewPatch.php" target="_blank">Add a New Patch</a>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="http://10.122.38.71/displayExistingProjectDeletePatch.php?id=<?php echo $id ?>" >Enable Patch Delete</a>
		</p>
	</dir>


	<!--Meliodas -->
	<dir style="width: 100%; float:left">
	<table class="css-serial" align="left" border="1" cellspacing="0" cellpadding="10">
		<thead><tr>
			<th align = "left">	<b>#</b> </th>		
			<th align = "left">	<b>Patch Name	</b> </th>		
			<th align = "left">	<b>Description  </b> </th>
		</tr></thead>
		<tbody>
	<?php 
		// If the query executed properly proceed
		if($patchesResult){
			// mysqli_fetch_array will return a row of data from the query
			// until no further data is available
			while($patchRow = mysqli_fetch_array($patchesResult))	{

			    echo   '<tr>
					<td></td>
					<!-- Meliodas
					<td align = "left"><a href="http://10.122.38.71/displayExistingPatch.php?releaseName='.$releaseName.'&projectName='.$projectName.'&patchName=',urlencode($patchRow["patchName"]),'" target="_blank" style="text-decoration:none">' . $patchRow['patchName'] . '</a></td>
					-->
					<td align = "left"><a href="http://10.122.38.71/displayExistingPatch.php?id=',urlencode($patchRow["id"]),'" target="_blank" style="text-decoration:none">' . $patchRow['patchName'] . '</a></td>
					<td align = "left"><textarea disabled type="text" name="descriptionInput" rows="3" cols="70">' . $patchRow['description'] . '</textarea></td>
				   </tr>';
#			    echo   '<tr>
#					<td align = "left"><textarea disabled type="text" name="descriptionInput" rows="5" cols="70">' . $patchRow['description'] . '</textarea></td>
#				   </tr>';

			}
	
		} else {
			echo "Couldn't issue database query<br />";
		} 


	?>

		</tbody>
	</table>
	</dir>
	<!--Meliodas-->




</form>
</body>
</html>
