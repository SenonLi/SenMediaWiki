<html>
<head>
<title>Add a New Project</title>
</head>
<body>
<form action="http://localhost/submitNewProjectInfo.php" method="post">

	<b>Add a New Project</b>

	<p> Release Name:  <input type="text" name="releaseNameInput" size="30" value=""/> </p>
	<p> Project Name:  <input type="text" name="projectNameInput" size="30" value=""/> </p>
	<p> Path:  <input type="text" name="pathInput" size="70" value=""/> </p>
	<p> Clone Command:  <input type="text" name="cloneCommandInput" size="70" value=""/> </p>
	<p> Description: </p>
	<p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea type="text" name="descriptionInput" rows="6" cols="70" value=""></textarea> </p>


	<p>	
		<input type="submit" name="submitButton" value="Submit" />
	</p>
</form>
</body>
</html>

