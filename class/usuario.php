<?php 
	require_once('class-conexion.php');
	$con = new Conexion();

	session_start();

	$usuario = $_POST['usu'];
	$contrasenia = $_POST['pass'];
	$accion = $_POST['accion'];
	$correo = $_POST['correo'];

	echo "Variables recibidas<br>".$usuario."<br>".$contrasenia."<br><br>";

	if($accion==1){
		$con->setUsuario($usuario);
		$con->setContrasena($contrasenia);

		$rs = $con->ejecutarInstruccion("select * from usuario where usuario = '$usuario' and contrasenia = '$contrasenia'");

		$validar = $con->cantidadRegistros($rs);

		echo "La variable validar esta en : ".$validar."<br>";

		if($validar>0){
			$_SESSION['usuario'] = $usuario;
			echo "Bienvenido: ".$_SESSION['usuario'];
			header('Location: ../index.php');
		}
		else{
			header('Location: ../log-in.html');
			echo "No se encontro el usuario";
		}
	}
	else{
		$fk = $con->ejecutarInstruccion("set foreign_key_checks = 0;"); // Las tablas estan relacionadas esta linea es provicional para hacer la prueba de registro

		$rs = $con->ejecutarInstruccion("insert into usuario(idusuario, usuario, contrasenia, idempleado) values(1, 'admin', 'admin', '1');");

		header('Location: ../log-in.html');
	}
?>