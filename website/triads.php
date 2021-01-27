<!DOCTYPE html>
<html>
<head>
	<title>RedDragonDB | Triadi</title>

	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link href='https://fonts.googleapis.com/css?family=Roboto:400,700,500,300' rel='stylesheet' type='text/css'>
	<link href="./res/css/triads-style.css" rel="stylesheet" type="text/css">
	<link href="./res/css/common-style.css" rel="stylesheet" type="text/css">
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
	<h1 class="title">TRIADI</h1>

	<table>
		<tr class="line-type-t">
			<th>Simbolo</th>
			<th>Nome</th>
			<th>Citt&agrave</th>
			<th>Numero membri</th>
			<th>Data fondazione</th>
			<th>Azioni</th>
		</tr>

		<!-- STAMPA DA DB -->

		<?php
			include ("connect_db.php");

			

			$sql = "SELECT * FROM TRIADE;";
			$result = $conn->query($sql);

			if ($result->num_rows > 0) {
			    while($row = $result->fetch_assoc()) {

			    	$sql_n = "SELECT COUNT(*) AS n_members FROM CAPO_DRAGONE WHERE cod_triade = " . $row["cod_triade"] . ";";
			    	$result_n = $conn->query($sql_n);
			    	$members = $result_n->fetch_assoc();

			    	$tot_members = $members['n_members'];

			    	$sql_n = "SELECT COUNT(*) AS n_members FROM LANTERNA_BLU WHERE cod_triade = " . $row["cod_triade"] . ";";
			    	$result_n = $conn->query($sql_n);
			    	$members = $result_n->fetch_assoc();

			    	$tot_members += $members['n_members'];

			    	$sql_n = "SELECT COUNT(*) AS n_members FROM INCARICATO WHERE cod_triade = " . $row["cod_triade"] . ";";
			    	$result_n = $conn->query($sql_n);
			    	$members = $result_n->fetch_assoc();

			    	$tot_members += $members['n_members'];

			    	$sql_n = "SELECT COUNT(*) AS n_members FROM SOLDATO WHERE cod_triade = " . $row["cod_triade"] . ";";
			    	$result_n = $conn->query($sql_n);
			    	$members = $result_n->fetch_assoc();

			    	$tot_members += $members['n_members'];


			    	echo "<tr class=\"line-type-a\">";
				    	echo "<td>N/D</td>";
				    	echo "<td><a href=\"./triad.php?tc=" . $row["cod_triade"] . "&tm=" . $tot_members . "\">" . $row["nome"] . "</a></td>";
				    	echo "<td>" . $row["citta"] . "</td>";
				    	echo "<td>" . $tot_members . "</td>";
				    	echo "<td>" . $row["data_fondazione"] . "</td>";
				    	echo "<td>";
							echo "<i class=\"material-icons\" id=\"settings-icon\" title=\"Modifica\">settings</i>";
							echo "<i class=\"material-icons\" id=\"delete-icon\" title=\"Cancella\">delete_forever</i>";
						echo "</td>";
			    	echo "</tr>";
			    }
			}else{
				
				echo "<p class=\"empty-message\">Nessuna trade presente in DB</p>";
			}
		?>

	</table>

</body>
</html>