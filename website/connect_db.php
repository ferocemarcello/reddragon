<?php
	$mysql_hostname = "localhost";
	$mysql_user = "reddragon";
	$mysql_password = "redpass";
	$mysql_database = "red_dragon";
	$bd = mysql_connect($mysql_hostname, $mysql_user, $mysql_password) or die("Could not connect database");
	mysql_select_db($mysql_database, $bd) or die("Could not select database");
?>