<html>
<head>
<title>Edit Tool</title>
</head>
<body>

<?php
$id = $_GET['id']; 

// Get a connection for the database
require_once('mySqlConnect.php');

// Create a query for the database
$projectQuery = "SELECT toolGroup, toolName, description, communityLicense, installationBinary, installInstruction FROM huawei_tools WHERE id='$id' ORDER BY toolName";

#	echo "$projectQuery";

// Get a response from the database by sending the connection
// and the query
$response = @mysqli_query($databaseConnection, $projectQuery);

// If the query executed properly proceed
if($response){

	// mysqli_fetch_array will return a row of data from the query
	// until no further data is available
	while($row = mysqli_fetch_array($response))	{

		$toolGroup = $row['toolGroup']; 
		$toolName = $row['toolName']; 
		$description = $row['description']; 
		$communityLicense = $row['communityLicense']; 
		$installationBinary = $row['installationBinary']; 
		$installInstruction = $row['installInstruction']; 

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
		<b>Edit Tool <font color="red"><?php echo "$toolName"  ?> </font></b>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="http://10.122.38.71/editExistingTool.php?id=<?php echo $id ?>" method="post">Enable Edit</a>
	</p>

	<p> Tool Group:  <input disabled type="text" name="toolGroupInput" size="30" value="<?php echo $toolGroup ?>"/> </p>
	<p> Tool Name:  <input disabled type="text" name="toolNameInput" size="30" value="<?php echo $toolName ?>"/> </p>
	<p> Description: </p>
	<p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea disabled type="text" name="descriptionInput" rows="6" cols="70" value=""><?php echo $description ?></textarea> </p>
	<p> Community License:  <input disabled type="text" name="communityLicenseInput" size="70" value="<?php echo $communityLicense ?>"/> </p>
	<p> Installation Binary:  <input disabled type="text" name="installationBinaryInput" size="70" value="<?php echo $installationBinary ?>"/> </p>
	<p> Install Instruction:  <input disabled type="text" name="installInstructionInput" size="70" value="<?php echo $installInstruction ?>"/> </p>


</form>
</body>
</html>
