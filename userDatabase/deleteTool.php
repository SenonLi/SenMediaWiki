<?php
$id = $_GET['id'];

if(isset($id))	{



		require_once('mySqlConnect.php');
		
		$deleteQuery = "DELETE FROM huawei_tools WHERE id='$id'";
	
#		echo "$insertQuery <br/><br/>";

		$statement = mysqli_prepare($databaseConnection, $deleteQuery);	
		mysqli_stmt_execute($statement);
		
		$affected_rows = mysqli_stmt_affected_rows($statement);
		if($affected_rows == 1)	{

			echo "Tool Deleted! <br/><br/>";
			mysqli_stmt_close($statement);
			mysqli_close($dataBaseConnection);

		} else if ($affected_rows == 0)	{
			echo "<font color=\"red\">No valid project to delete.</font><br/><br/>";
			mysqli_stmt_close($statement);
			mysqli_close($dataBaseConnection);
		}else {

			echo 'Error Occurred <br />';
			echo mysqli_error($statement);
			
			printf("affected_rows = %d. \n", $affected_rows);

			mysqli_stmt_close($statement);
			mysqli_close($dataBaseConnection);
		}




}





?>
