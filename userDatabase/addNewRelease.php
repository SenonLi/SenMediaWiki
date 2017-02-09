<html>
<head>
<title>Add a New Release</title>
</head>
<body>
<form action="http://localhost/submitNewReleaseInfo.php" method="post">

	<b>Add a New Release</b>

	<p> Model:  <input type="text" name="modelInput" size="70" value=""/> </p>
	<p> Release:  <input type="text" name="releaseNameInput" size="30" value=""/> </p>
	<p> Source:  <input type="text" name="sourceNameInput" size="70" value=""/> </p>
	<p> Image:  <input type="text" name="imageNameInput" size="70" value=""/> </p>
	<p> Patch:  <input type="text" name="patchInput" size="70" value=""/> </p>

	<p>	
		<input type="submit" name="submitButton" value="Submit" />
	</p>
</form>
</body>
</html>
