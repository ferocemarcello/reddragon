<?php
	include ("connect_db.php");

	$result_text = base64_decode($_GET['restext']);
	$result_color = $_GET['rescolor'];

	if ($result_text == '') {
		
		$result_display = 'none';
	}else{

		$result_display = 'block';
	}
?>

<!DOCTYPE html>
<html>
<head>
	<title></title>

	<!--<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">-->
	<link href='https://fonts.googleapis.com/css?family=Roboto:400,700,500,300' rel='stylesheet' type='text/css'>
	<link href="./res/css/common-style.css" rel="stylesheet" type="text/css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	<script type="text/javascript" src="./res/js/script.js"></script>

	<style type="text/css">

		.result{

			display: <?php echo $result_display;?>;
			margin: 10% auto 0 auto;
			width: 300px;
			height: 80px;
			text-align: center;
			background-color: rgba(0,0,0, .4);
		}

		.result p{

			padding: 30px;
			font-weight: 700;
		}

		.reg-form{

			display: block;
			width: 40%;
			margin: 5% auto 0 auto;
			padding: 30px;
			text-align: center;
			border: solid 1px #2c3e50;
			border-radius: 5px;
		}

		select{

			display: block;
			width: 300px;
			margin: 0 auto 0 auto;
		}

		.reg-input{

			display: block;
			width: 300px;
			margin: 20px auto 0 auto;
		}

		#criminal-reg{

			display: none;
		}

		#instructeds-list{

			display: none;
		}

		.reg-submit-btn{

			border: none;
			border-bottom: solid 3px #c0392b;
			background-color: #e74c3c;
			color: #fff;
		}

		.reg-submit-btn:hover{

			border-bottom: solid 3px #e74c3c;
			cursor: pointer;
		}

		#new_affiliation_form{

			display: none;
		}

		#affiliation_exists_list{

			display: none;
		}
		
	</style>
</head>
<script type="text/javascript">
	
	function entitySelected() {
		
		var choice = document.getElementById("entity-selector").selectedIndex;

		if (choice == 1) {

			$("#criminal-reg").css("display","block");
		} else {

			$("#criminal-reg").css("display","none");
		}

		if (choice == 2) {

			$("#triad-reg").css("display","block");
		} else {

			$("#triad-reg").css("display","none");
		}

		if (choice == 3) {

			$("#military-action-reg").css("display","block");
		} else {

			$("#military-action-reg").css("display","none");
		}

		if (choice == 4) {

			$("#instructeds-reg").css("display","block");
		} else {

			$("#instructeds-reg").css("display","none");
		}
	}

	function instructedSelected() {
		
		var choice = document.getElementById("criminal-type-reg").selectedIndex;

		if (choice == 3) {

			$("#instructeds-list").css("display","block");
		} else {

			$("#instructeds-list").css("display","none");
		}

		if (choice == 4) {

			$("#criminal_chief_dragon_name").css("display","none");
		} else {

			$("#criminal_chief_dragon_name").css("display","block");
		}
	}

	function affiliation_selected() {
		
		if ($('#affiliation_type_new_radio').is(':checked')) {

			$('#new_affiliation_form').css("display", "block");
			$('#affiliation_exists_list').css("display", "none");
		}else{

			$('#new_affiliation_form').css("display", "none");
			$('#affiliation_exists_list').css("display", "block");
		}
	}

</script>
<body>

<h1 class="title">REGISTRAZIONE</h1>
	
	<div class="result">
		<p style="color: #<?php echo $result_color;?>;border: solid 1px #<?php echo $result_color;?>;"><?php echo $result_text;?></p>
	</div>
	<form class="reg-form" method="POST" action="reg_script.php">
	<p>Scegli l'entit&agrave da registrare:</p>
	<select name="entity_selector" id="entity-selector" onchange="entitySelected();">
	  <option value="none">-- Scegli entit&agrave --</option>
	  <option value="criminal">Criminale</option>
	  <option value="triad">Triade</option>
	  <option value="military-action">Azione Militare</option>
	  <option value="entry">Voce di Bilancio</option>
	</select>

	<!-- ====== CRIMINAL ====== -->
	<div id="criminal-reg" onchange="instructedSelected();">
		<input class="reg-input" name="criminal_nickname" type="text" placeholder="Nome mafioso"></input>
		<p>Grado criminale:</p>
		<select name="criminal_type" id="criminal-type-reg">
		  <option value="none">-- Scegli rango --</option>
		  <option value="blue_lantern">Lanterna Blu</option>
		  <option value="soldier">Soldato</option>
		  <option value="instructed" id="instructed">Incaricato</option>
		  <option value="chief_dragon">Capo Dragone</option>
		</select>
		<div id="instructeds-list">
			<p>Grado incaricato:</p>
			<select name="instructed_rank">
				<option value="none">-- Scegli rango --</option>
				<option value="vanguard">Avanguardia</option>
				<option value="deputy_chief_mountain">Vice Capo Montagna</option>
				<option value="chief_incense">Capo Incenso</option>
				<option value="range_of_white_paper">Ventaglio di Carta Bianco</option>
				<option value="red_pale">Palo Rosso</option>
			</select>
		</div>
		
		<input class="reg-input" name="criminal_tax_code" type="text" placeholder="Codice fiscale" style="text-transform: uppercase;"></input>
		<p>Data di nascita:</p>
		<input class="reg-input" name="criminal_birth_date" type="date" placeholder="Data di nascita"></input>
		<input class="reg-input" name="criminal_name" type="text" placeholder="Nome anagrafico"></input>
		<input class="reg-input" name="criminal_surname" type="text" placeholder="Cognome anagrafico"></input>
		<p>Triade di appartenenza:</p>
		<select name="criminal_triad_code">
			<option value="none">-- Scegli triade --</option>
			<?php
				$sql = "SELECT cod_triade, nome FROM TRIADE";
				$result = $conn->query($sql);

				if ($result->num_rows > 0) {
				    while($row = $result->fetch_assoc()) {
				    	echo "<option value=\"".$row['cod_triade']."\">".$row['nome']."</option>";
				    }
				}
			?>
		</select>

		<p>Affiliazione:</p>
		<fieldset name="affiliation_value">
			<legend>Tipo di affiliazione:</legend>
				<input id="affiliation_type_new_radio" type="radio" name="affiliation_type_n" value="new" onclick="affiliation_selected();"></input> Nuova affiliazione
				<input id="affiliation_type_exists_radio" type="radio" name="affiliation_type_e" value="exists" onclick="affiliation_selected();"></input> Affiliazione esistente
				
					<select id="affiliation_exists_list" name="affiliation_exists_code">
						<option value="none">-- Scegli affiliazione --</option>
						<?php
							$sql = "SELECT cod_affiliazione,data_af FROM AFFILIAZIONE";
							$result = $conn->query($sql);

							if ($result->num_rows > 0) {
							    while($row = $result->fetch_assoc()) {
							    	echo "<option value=\"".$row['cod_affiliazione']."\">".$row['cod_affiliazione']. " | " . $row['data_af'] . "</option>";
							    }
							}
						?>
					</select>

				<div id="new_affiliation_form">
					<p>Data di affiliazione:</p>
					<input class="reg-input" type="date" name="affiliation_date"></input>
					<input class="reg-input" type="text" name="affiliation_place" placeholder="Luogo di affiliazione"></input>
					<input class="reg-input" type="text" name="affiliation_animal" placeholder="Animale sacrificato"></input>
				</div>

		</fieldset>
	</div>

	<!-- ====== TRIAD ====== -->
	<div id="triad-reg" style="display: none;">
		<input class="reg-input" name="triad_city" type="text" placeholder="Citt&agrave di esercizio dell'attivit&agrave"></input>
		<input class="reg-input" name="triad_name" type="text" placeholder="Nome triade"></input>
		<p>Data di fondazione:</p>
		<input class="reg-input" name="triad_foundation_date" type="date"></input>
		<p>Simbolo triade:</p>
		<input type="hidden" name="MAX_FILE_SIZE" value="30000" />
		<input class="reg-input" name="triad_logo" type="file"></input>
	</div>

	<!-- ====== MILITARY ACTION ====== -->
	<div id="military-action-reg" style="display: none;">

	<p>Tipo azione militare:</p>
		<select>
			<option value="none">-- Scegli tipo azione militare --</option>
			<option value="war">Guerra</option>
		</select>

		<p>Data azione militare:</p>
		<input class="reg-input" name="ma_date" type="date"></input>
		<input class="reg-input" name="ma_finally" type="text" placeholder="Nome triade"></input>
		<input class="reg-input" name="name_red_pale" type="text" placeholder="Nome mafioso del Palo Rosso"></input>
	</div>

	<input class="reg-submit-btn reg-input" name="submit" type="submit" value="Registra"></input>
</form>
</body>
</html>