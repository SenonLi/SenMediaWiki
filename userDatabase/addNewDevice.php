<html>
<head>
<title>Add a New Device</title>
</head>
<body>
<form action="http://10.122.38.71/submitNewDeviceInfo.php" method="post">

	<b>Add a New Device</b>

	<p> Device ID:  <input type="text" name="deviceIDInput" size="30" value=""/> </p>
	<p> Model:  <input type="text" name="modelInput" size="30" value=""/> </p>
	<p><font color="red">Please make sure there already exits an employee with the right Empolyee ID being the "Onwer ID".</font></p>
	<p> Owner ID:  <input type="text" name="ownerIDInput" size="30" value=""/> </p>
	<p> Owner Name:  <input type="text" name="ownerNameInput" size="30" value=""/> </p>


	<p>	
		<input type="submit" name="submitButton" value="Submit" />
	</p>
</form>
</body>
</html>
