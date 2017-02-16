<html>
<head>
<title>Add a New Release</title>
</head>
<body>
<form action="http://10.122.38.71/submitNewReleaseInfo.php" method="post">

	<b>Add a New Release</b> 
	<p>(Make sure you already got "Source" and "Image" with identical names in Wiki)</p>
	<br/>

	<p> Model:  <input type="text" name="modelInput" size="70" value=""/> </p>
	<p> Release Name:  <input type="text" name="releaseNameInput" size="70" value=""/> </p>
	<p> Source Name:  <input type="text" name="sourceNameInput" size="70" value=""/> </p>
	<p> Image Name:  <input type="text" name="imageNameInput" size="70" value=""/> </p>
	<p><input type="hidden" name="patchInput" width="0" size="0" value=""/> </p>

	<p>	
		<input type="submit" name="submitButton" value="Submit" />
	</p>
</form>
</body>
</html>
