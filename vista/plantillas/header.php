<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>CenterMedicine</title>
	<link rel="stylesheet" href="css/estilos.css">
	<link href="https://fonts.googleapis.com/css?family=Antic" rel="stylesheet">
	<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
	<link rel="icon" type="image/x-icon" href="img/favicon.png">
</head>
<body>
    <header>
		<?php require_once('./class/class-conexion.php');
	 	  $con = new Conexion();

	 	  session_start();
	 	  $usuario = $_SESSION['usuario'];
 	  	?>
		<div class="wrapp">
			<a href="index.php" title="CenterMedicine">Clínica<a class="bordes" href="index.php" title="CenterMedicine">Odontológica</a><span>V1</span></a>
			<p style="float: right;">USUARIO: <?php echo $usuario; ?></p>
            <div class="usuario">
                <a href="cerrar.php" title="Cerrar Sesion"> Salir</a>                
            </div>
		</div>
	</header>