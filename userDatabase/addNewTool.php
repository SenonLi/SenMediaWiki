<html>
<head>
<title>Add a New Tool</title>
</head>
<body>
<form action="http://10.122.38.71/submitNewToolInfo.php" method="post">

	<b>Add a New Tool</b>

	<p> Tool Group:  <input type="text" name="toolGroupInput" size="30" value=""/> </p>
	<p> Tool Name:  <input type="text" name="toolNameInput" size="30" value=""/> </p>
	<p> Description: </p>
	<p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea type="text" name="descriptionInput" rows="6" cols="70" value=""></textarea> </p>
	<p> Community License:  <input type="text" name="communityLicenseInput" size="70" value=""/> </p>
	<p> Installation Binary:  <input type="text" name="installationBinaryInput" size="70" value=""/> </p>
	<p> Install Instruction:  <input type="text" name="installInstructionInput" size="70" value=""/> </p>

	<p>	
		<input type="submit" name="submitButton" value="Submit" />
	</p>
</form>
</body>
</html>

