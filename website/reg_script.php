<?php

	include ("connect_db.php");

	function getChiefDragonName($triad_code='')
	{

		include ("connect_db.php");

		$sql = "SELECT CAPO_DRAGONE.nome_mafioso FROM CAPO_DRAGONE where CAPO_DRAGONE.cod_triade = " . $triad_code . ";";
		$result = $conn->query($sql);

		if ($result->num_rows == 1) {
		    while($row = $result->fetch_assoc()) {
		    	
		    	$chief_dragon_name = $row["nome_mafioso"];
		    }
		}else{

			return NULL;
		}

		return $chief_dragon_name;
	}

	function check_chief_dragon($nickname='')
	{

		include ("connect_db.php");

		$sql = "SELECT nome_mafioso FROM CAPO_DRAGONE WHERE nome_mafioso = " . $nickname;
		$result = $conn->query($sql);

		if ($result->num_rows > 0) {
		    		
		    	return FALSE;
		    }

		    return TRUE;
	}

	function genAffiliationCode()
	{

		include ("connect_db.php");

		$x = 0;
		while ($x < 1) {

			$x = 1;
			$aff_code = ((rand(0,999) + 1));

			$sql = "SELECT cod_affiliazione FROM AFFILIAZIONE WHERE cod_affiliazione = " . $aff_code;

			$result = $conn->query($sql);

			if ($result->num_rows > 0) {

			    $x = 0;
			}
		}

		return $aff_code;
	}

	$entity_selector = $_POST['entity_selector'];
	$criminal_type = $_POST["criminal_type"];
	$instructed_rank = $_POST["instructed_rank"];


	if ( $entity_selector == 'criminal') {
		
		if ($criminal_type == 'chief_dragon') {

			$chief_dragon_flag = TRUE;
		}elseif ($criminal_type == 'blue_lantern') {
			
			$blue_lantern_flag = TRUE;
		}

		$criminal_nickname = $_POST["criminal_nickname"];
		$criminal_triad_code = $_POST["criminal_triad_code"];
		$criminal_tax_code = $_POST["criminal_tax_code"];
		$criminal_birth_date = $_POST["criminal_birth_date"];
		$criminal_name = $_POST["criminal_name"];
		$criminal_surname = $_POST["criminal_surname"];

		if (! $blue_lantern_flag) {

			$affiliation_value = $_POST['affiliation_value'];

			$affiliation_date = $_POST["affiliation_date"];
			$affiliation_place = $_POST["affiliation_place"];
			$affiliation_animal = $_POST["affiliation_animal"];

			if (isset($_POST['affiliation_type_n'])) {
				
				$affiliation_code = genAffiliationCode();

				$sql = "INSERT INTO AFFILIAZIONE VALUES ('".$affiliation_code."', '".$affiliation_date."', '1' ,'".$affiliation_place."', '".$affiliation_animal."')";

				if (!$conn->query($sql) === TRUE) {
				    
				    $result_text = base64_encode("Errore nella creazione della Affliazione!");
				    header("Location: ./registration.php?rescolor=c0392b&restext=$result_text");
				    //echo "FAIL!";
				}

			}elseif (isset($_POST['affiliation_type_e'])){

				$affiliation_code = $_POST['affiliation_exists_code'];

				echo $affiliation_code . "\n";

				$sql = "SELECT cod_affiliazione,numero_affiliandi FROM AFFILIAZIONE WHERE cod_affiliazione = " . $affiliation_code;

				$result = $conn->query($sql);

				if ($result->num_rows == 1) {
				    while($row = $result->fetch_assoc()) {
				    		
				    	$old_aff_number = $row["numero_affiliandi"];
				    }
				    
				    echo "Vecchio numero di affiliandi: " . $old_aff_number . "\n";
				}else{

					$result_text = base64_encode("Errore nella creazione della Affliazione![2.0]");
				    header("Location: ./registration.php?rescolor=c0392b&restext=$result_text");
				    //echo "FAIL!";
				}

				$sql = "UPDATE AFFILIAZIONE SET numero_affiliandi = " . (($old_aff_number+1)) . " WHERE cod_affiliazione = " . $affiliation_code . ";";

				if (!$conn->query($sql) === TRUE) {
				    
				    $result_text = base64_encode("Errore nella creazione della Affliazione![2.1]");
				    header("Location: ./registration.php?rescolor=c0392b&restext=$result_text");
				    //echo "FAIL!";
				}

			}else{

				$result_text = base64_encode("Errore CRITICO nella creazione della Affliazione![3]");
				header("Location: ./registration.php?rescolor=c0392b&restext=$result_text");
			}
		}

		if (! $chief_dragon_flag) {

			if ($blue_lantern_flag) {

				$criminal_chief_dragon_name = getChiefDragonName($criminal_triad_code);

				$sql = "INSERT INTO LANTERNA_BLU VALUES ('".$criminal_nickname."', '".$criminal_tax_code."', '".$criminal_birth_date."' ,'".$criminal_name."', '".$criminal_surname."', '".$criminal_chief_dragon_name."', '".$criminal_triad_code."')";

				if ($conn->query($sql) === TRUE) {

					$result_text = base64_encode("Lanterna Blu creata con successo!");
				    header("Location: ./registration.php?rescolor=27ae60&restext=$result_text");
				    //echo "OK!";
				} else {
				    
				    $result_text = base64_encode("Errore nella creazione della Lanterna Blu! [" . $criminal_chief_dragon_name . "]");
				    header("Location: ./registration.php?rescolor=c0392b&restext=$result_text");
				    //echo "FAIL!";
				}
			}
		}else{

				//TESTO DI DEBUG
				//echo "Capo dragone disponibile: " . $check_chief_dragon($criminal_nickname);

				/*
				*********** REGISTRAZIONE CAPO DRAGONE ***********
				*/

				$check_chief_dragon_var = check_chief_dragon($criminal_nickname);
				if ($check_chief_dragon_var) {
					//TESTO DI DEBUG
					//echo "Identificato Capo Dragone <br>";

					$sql = "INSERT INTO CAPO_DRAGONE VALUES ('".$criminal_nickname."', '".$criminal_triad_code."', '".$criminal_tax_code."' ,'".$criminal_birth_date."', '".$criminal_name."' , '".$criminal_surname."' , '".$affiliation_code."' )";

					

					if ($conn->query($sql) === TRUE) {

						$result_text = base64_encode("Capo Dragone inserito con successo! [CODICE DI AFFILIAZIONE: " . $affiliation_code . "]");
					    header("Location: ./registration.php?rescolor=27ae60&restext=$result_text");
			   		 	//echo "OK!";
					} else {
					    
					    $result_text = base64_encode("Errore nell'inserimento del Capo Dragone!");

					    /*echo "Some info:" . "<br>";
					    echo "Nick:" . $criminal_nickname . "<br>";
					    echo $criminal_triad_code . "<br>";
					    echo $criminal_tax_code . "<br>";
					    echo $criminal_birth_date . "<br>";
					    echo $criminal_name . "<br>";
					    echo $criminal_surname . "<br>";
					    echo $affiliation_code . "<br>";*/
					    header("Location: ./registration.php?rescolor=c0392b&restext=$result_text");
			    		//echo "FAIL!";
					}
				}else{

					echo "<br>Nome capo dragone (". $criminal_nickname .") gi&agrave in uso!<br>";
					$result_text = base64_encode("Nome capo dragone \"". $criminal_nickname ."\" gi&agrave in uso!");
					header("Location: ./registration.php?rescolor=c0392b&restext=$result_text");
			    	//echo "FAIL!";
				}
			}

	/*
	********** REGISTRAZIONE TRIADE ***********
	*/
	}elseif ( $entity_selector == 'triad') {
		
		$triad_city = $_POST["triad_city"];
		$triad_name = $_POST["triad_name"];
		$triad_foundation_date = $_POST["triad_foundation_date"];

		//Genera un codice che metterà nella variabile triad_code
		$x = 0;
		while ($x < 1) {

			$x = 1;
			$triad_code = ((rand(0,999) + 1));
			echo "Generato: $triad_code ";
			$sql = "SELECT cod_triade FROM TRIADE";

			$result = $conn->query($sql);

			if ($result->num_rows > 0) {
			    while($row = $result->fetch_assoc()) {
			    	if ($row["cod_triade"] == $triad_code) {
			    		
			    		$x = 0;
			    	}
			    }
			}
		}

		$sql = "INSERT INTO TRIADE VALUES ('".$triad_city."', '".$triad_code."', '".$triad_name."' ,'".$triad_foundation_date."')";

		if ($conn->query($sql) === TRUE) {

			$result_text = base64_encode("Triade creata con successo!");
		    header("Location: ./registration.php?rescolor=27ae60&restext=$result_text");
		    //echo "OK!";
		} else {
		    
		    $result_text = base64_encode("Errore nella creazione della triade!");
		    header("Location: ./registration.php?rescolor=c0392b&restext=$result_text");
		    //echo "FAIL!";
		}
	}
?>