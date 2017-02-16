<html>
<head>
<title>Add a New Source Code</title>
</head>
<body>
<form action="http://10.122.38.71/submitNewSourceCode.php" method="post">

	<b>Add a New Source Code Repo</b>

	<p> Name:  <input type="text" name="nameInput" size="30" value=""/> </p>
	<p> Description: </p>
	<p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea type="text" name="descriptionInput" rows="6" cols="70" value=""></textarea> </p>
	<p> Build Instruction: </p>
	<p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea type="text" name="buildInstructionInput" rows="6" cols="70" value=""></textarea> </p>
	<p> Location:  <input type="text" name="locationInput" size="70" value=""/> </p>


	<p>	
		<input type="submit" name="submitButton" value="Submit" />
	</p>
</form>
</body>
</html>
