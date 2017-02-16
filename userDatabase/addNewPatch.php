<html>
<head>
<title>Add a New Patch</title>
</head>
<body>
<form action="http://10.122.38.71/submitNewPatchInfo.php" method="post">

	<b>Add a New Patch</b>

	<p> Release Name:  <input type="text" name="releaseNameInput" size="30" value=""/> </p>
	<p> Project Name:  <input type="text" name="projectNameInput" size="30" value=""/> </p>
	<p> Patch Name:  <input type="text" name="patchNameInput" size="30" value=""/> </p>
	<p> Description: </p>
	<p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea type="text" name="descriptionInput" rows="5" cols="70" value=""></textarea> </p>

	<p>	
		<input type="submit" name="submitButton" value="Submit" />
	</p>
</form>
</body>
</html>
