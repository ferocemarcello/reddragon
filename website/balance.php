<?php

	$triad_name = 'T Name';

	/* Assegnamento colori [NON mettere # prima dell'hex]*/

	$spaccio_color = '2c3e50';
	$prostituzione_color = 'f62459';
	$traffico_illegale_color = '1abc9c';
	$pizzo_color = '2980b9';
	$corruzione_color = 'e67e22';

	/* Assegnamento valori [int] */

	$spaccio_value = '60';
	$prostituzione_value = '20';
	$e_traffico_illegale_value = '40';
	$pizzo_value = '10';
	$e_tot_value = (($spaccio_value + $prostituzione_value + $e_traffico_illegale_value + $pizzo_value));

	$corruzione_value = '20';
	$u_traffico_illegale_value = '80';
	$u_tot_value = (($u_traffico_illegale_value + $corruzione_value));

	$tot_net_profit = (($e_tot_value - $u_tot_value));


	/* Assegnamento valori [%]*/

	$spaccio_p_value = (($spaccio_value * 100 / $e_tot_value));
	$prostituzione_p_value = (($prostituzione_value * 100 / $e_tot_value));
	$e_traffico_illegale_p_value = (($e_traffico_illegale_value * 100 / $e_tot_value));
	$pizzo_p_value = (($pizzo_value * 100 / $e_tot_value));

	$corruzione_p_value = (($corruzione_value * 100 / $u_tot_value));
	$u_traffico_illegale_p_value = (($u_traffico_illegale_value * 100 / $u_tot_value));
?>
<!DOCTYPE html>
<html>
<head>
	<title>RedDragonDB | Bilancio <?php echo "$triad_name";?></title>

	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link href='https://fonts.googleapis.com/css?family=Roboto:400,700,500,300' rel='stylesheet' type='text/css'>
	<link href="./res/css/common-style.css" rel="stylesheet" type="text/css">
	<link href="./res/css/balance-style.css" rel="stylesheet" type="text/css">

	<style type="text/css">

	#e-spaccio-tower{

		background-color: #<?php echo $spaccio_color;?>;
		height: <?php echo $spaccio_p_value;?>%;
		position: relative;
		top: <?php echo ((100 - $spaccio_p_value));?>%;
	}

	#e-prostituzione-tower{

		background-color: #<?php echo $prostituzione_color;?>;
		height: <?php echo $prostituzione_p_value;?>%;
		position: relative;
		top: <?php echo ((100 - $prostituzione_p_value));?>%;
	}

	#e-traffico-illegale-tower{

		background-color: #<?php echo $traffico_illegale_color;?>;
		height: <?php echo $e_traffico_illegale_p_value;?>%;
		position: relative;
		top: <?php echo ((100 - $e_traffico_illegale_p_value));?>%;
	}

	#e-pizzo-tower{

		background-color: #<?php echo $pizzo_color;?>;
		height: <?php echo $pizzo_p_value;?>%;
		position: relative;
		top: <?php echo ((100 - $pizzo_p_value));?>%;
	}

	#u-traffico-illegale-tower{

		background-color: #<?php echo $traffico_illegale_color;?>;
		height: <?php echo $u_traffico_illegale_p_value;?>%;
		position: relative;
		top: <?php echo ((100 - $u_traffico_illegale_p_value));?>%;
	}

	#u-corruzione-tower{

		background-color: #<?php echo $corruzione_color;?>;
		height: <?php echo $corruzione_p_value;?>%;
		position: relative;
		top: <?php echo ((100 - $corruzione_p_value));?>%;
	}

	/* ============================================== */
	/* REVENUE NET PROFIT GRAPHIC */

	.balance-net-profit-field-graphic:hover > #net-profit-revenue-spaccio{

		
		width: <?php echo $spaccio_p_value;?>%;
		background-color: #<?php echo $spaccio_color;?>;
	}

	.balance-net-profit-field-graphic:hover > #net-profit-revenue-prostituzione{

		
		width: <?php echo $prostituzione_p_value;?>%;
		background-color: #<?php echo $prostituzione_color;?>;
	}

	.balance-net-profit-field-graphic:hover > #net-profit-revenue-traffico-illegale{

		
		width: <?php echo $e_traffico_illegale_p_value;?>%;
		background-color: #<?php echo $traffico_illegale_color;?>;
	}

	.balance-net-profit-field-graphic:hover > #net-profit-revenue-pizzo{

		
		width: <?php echo $pizzo_p_value;?>%;
		background-color: #<?php echo $pizzo_color;?>;
	}

	/* ============================================== */
	/* REVENUE NET PROFIT GRAPHIC */

	.balance-net-profit-field-graphic:hover > #net-profit-outflow-corruzione{

		
		width: <?php echo $corruzione_p_value;?>%;
		background-color: #<?php echo $corruzione_color;?>;
	}

	.balance-net-profit-field-graphic:hover > #net-profit-outflow-traffico-illegale{

		
		width: <?php echo $u_traffico_illegale_p_value;?>%;
		background-color: #<?php echo $traffico_illegale_color;?>;
	}

	/* ============================================== */

	</style>
</head>

<body>

	<nav class="secondary-nav">

		<i class="material-icons" id="burger-menu">menu</i>
		<li class="nav-item"><a href="./index.html">Home</a></li>
		<li class="nav-item"><a id="active-item" href="./index.html">Criminali</a></li>
		<li class="nav-item"><a href="./index.html">Triadi</a></li>
		<li class="nav-item"><a href="./index.html">Bilanci</a></li>
	</nav>
	<br><br>
	<h1 class="title">BILANCIO</h1>
	<div class="balance-triad-info">
		<div class="balance-triad-logo"></div>
		<span class="balance-triad-name"><?php echo $triad_name;?></span>
		<div class="balance-triad-logo"></div>
	</div>

	<!--********************* ENTRATE *********************-->
	<div class="balance-type-container">
		<p class="balance-type-title">Entrate</p>
		<div class="balance-type-info" id="balance-type-graphic">
			
			<div class="balance-graphic-tower" id="e-spaccio-tower"></div>
			<div class="balance-graphic-tower" id="e-prostituzione-tower"></div>
			<div class="balance-graphic-tower" id="e-traffico-illegale-tower"></div>
			<div class="balance-graphic-tower" id="e-pizzo-tower"></div>

		</div>
		<div class="balance-type-info" id="balance-type-text">
			
			<p class="balance-type-subtitle">Voci entrate</p>
			
			<i class="material-icons" style="margin-left: 30px; color: #<?php echo $spaccio_color;?>">fiber_manual_record</i><span class="balance-info-field">Spaccio: <?php echo $spaccio_value;?> &#165;</span><br>
			
			<i class="material-icons" style="margin-left: 30px; color: #<?php echo $prostituzione_color;?>">fiber_manual_record</i><span class="balance-info-field">Prostituzione: <?php echo $prostituzione_value;?> &#165;</span><br>
			
			<i class="material-icons" style="margin-left: 30px; color: #<?php echo $traffico_illegale_color;?>">fiber_manual_record</i><span class="balance-info-field">Traffico illegale: <?php echo $e_traffico_illegale_value;?> &#165;</span><br>
			
			<i class="material-icons" style="margin-left: 30px; color: #<?php echo $pizzo_color;?>">fiber_manual_record</i><span class="balance-info-field">Pizzo: <?php echo $pizzo_value;?> &#165;</span>

		</div>
	</div>

	<!--********************* USCITE *********************-->
	<div class="balance-type-container">
		<p class="balance-type-title">Uscite</p>
		<div class="balance-type-info" id="balance-type-graphic">
			
			<div class="balance-graphic-tower" id="u-corruzione-tower"></div>
			<div class="balance-graphic-tower" id="u-traffico-illegale-tower"></div>

		</div>
		<div class="balance-type-info" id="balance-type-text">
			
			<p class="balance-type-subtitle">Voci uscite</p>
			
			<i class="material-icons" style="margin-left: 30px; color: #<?php echo $corruzione_color;?>">fiber_manual_record</i><span class="balance-info-field">Corruzione: <?php echo $corruzione_value;?> &#165;</span><br>

			<i class="material-icons" style="margin-left: 30px; color: #<?php echo $traffico_illegale_color;?>">fiber_manual_record</i><span class="balance-info-field">Traffico illegale: <?php echo $u_traffico_illegale_value;?> &#165;</span>

		</div>
	</div>

	<!--********************* NETTO *********************-->
	<div class="balance-type-container">
	<p class="balance-type-title">Profitto netto</p>
		<div class="balance-net-profit-graphic">
			<div class="balance-net-profit-field-graphic" id="net-profit-outflow">
				<div class="net-profit-inside-field" id="net-profit-outflow-corruzione"></div>
				<div class="net-profit-inside-field" id="net-profit-outflow-traffico-illegale"></div>
			</div>
			<div class="balance-net-profit-field-graphic" id="net-profit-revenue">
				<div class="net-profit-inside-field" id="net-profit-revenue-spaccio"></div>
				<div class="net-profit-inside-field" id="net-profit-revenue-prostituzione"></div>
				<div class="net-profit-inside-field" id="net-profit-revenue-traffico-illegale"></div>
				<div class="net-profit-inside-field" id="net-profit-revenue-pizzo"></div>
			</div>
		</div>

		<div class="net-profit-calc-container">
			<div class="net-profit-calc">
				<p>Spaccio</p><p>
				<p>Prostituzione</p>
				<p>Traffico illegale</p>
				<p>Pizzo</p>

				<p>Corruzione</p>
				<p>Traffico illegale</p>

				<p id="net-profit-calc-total">Profitto netto</p>
			</div>
			<div class="net-profit-calc" id="net-profit-calc-values">
				<p><?php echo $spaccio_value;?> &#165;</p>
				<p>+  <?php echo $prostituzione_value;?> &#165;</p>
				<p>+  <?php echo $e_traffico_illegale_value;?> &#165;</p>
				<p>+  <?php echo $pizzo_value;?> &#165;</p>

				<p>-  <?php echo $corruzione_value;?> &#165;</p>
				<p>-  <?php echo $u_traffico_illegale_value;?> &#165;</p>

				<div class="net-profit-calc-line"></div>

				<p>=  <?php echo $tot_net_profit;?> &#165;</p>
			</div>
		</div>
		
	</div>
</body>
</html>