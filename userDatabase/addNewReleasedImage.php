<html>
<head>
<title>Add a New Image</title>
</head>
<body>
<form action="http://10.122.38.71/submitNewReleasedImage.php" method="post">

	<b>Add a New Image</b>

	<p> Image Name:  <input type="text" name="nameInput" size="30" value=""/> </p>
	<p> Description: </p>
	<p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea type="text" name="descriptionInput" rows="6" cols="70" value=""></textarea> </p>
	<p> Instruction: </p>
	<p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea type="text" name="instructionInput" rows="6" cols="70" value=""></textarea> </p>
	<p> Path:  <input type="text" name="tagInput" size="70" value=""/> </p>


	<p>	
		<input type="submit" name="submitButton" value="Submit" />
	</p>
</form>
</body>
</html>
