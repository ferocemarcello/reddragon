<?php
	
	include ("connect_db.php");

	$triad_code = $_GET["tc"];
	$triad_n_members = $_GET["tm"];

	$sql = "SELECT * FROM TRIADE WHERE cod_triade = " . $triad_code . ";";

	$result = $conn->query($sql);

	if ($result->num_rows == 1) {
	    while($row = $result->fetch_assoc()) {

	    	$triad_name = $row["nome"];
	    	$triad_foundation_date = $row["data_fondazione"];
	    }
	}
?>

<!DOCTYPE html>
<html>
<head>
	<title></title>

	<link href='https://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link href="./res/css/common-style.css" rel="stylesheet" type="text/css">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>

	<style type="text/css">

		body{

			background: url(./res/images/home-bg.jpg);
			background-color: #000;
			background-size: cover;
			background-repeat: no-repeat;
			background-position: center;

			display: block;
			height: 90vh;
			width: 100%;

			margin: 0;
		}

		*{

			color: #fff;
			font-family: Roboto;
			font-weight: 300;
		}

		.logo{

			display: block;
			margin: 20px auto 0 auto;
			height: 100px;
			width: 100px;
		}

		h1{

			text-align: center;
			font-size: 30px;
		}

		h2{

			text-align: center;
			font-size: 22px;
		}

		h3{
			
			font-size: 15px;
			font-weight: 700;
		}

	</style>
</head>
<body>

	<nav class="secondary-nav">

		<i class="material-icons" id="burger-menu">menu</i>
		<li class="nav-item"><a href="./index.html">Home</a></li>
		<li class="nav-item"><a href="./index.html">Criminali</a></li>
		<li class="nav-item"><a id="active-item" href="./index.html">Triadi</a></li>
		<li class="nav-item"><a href="./index.html">Bilanci</a></li>
	</nav>
	<br><br>
	<h1 class="title"><?php echo $triad_name;?></h1>

	<p><span style="font-weight: 700;">Codice triade: </span>#<?php echo $triad_code;?></p>
	<p><span style="font-weight: 700;">Nome triade: </span>"<?php echo $triad_name;?>"</p>
	<p><span style="font-weight: 700;">Data di fondazione: </span><?php echo $triad_foundation_date;?></p>
	<p><span style="font-weight: 700;">Totale membri: </span><?php echo $triad_n_members;?></p>

</body>
</html>