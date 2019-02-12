<?php 
	require_once('class-conexion.php');
	$con = new Conexion();

	session_start();

	$usuario = $_POST['usu'];
	$contrasenia = $_POST['pass'];
	$accion = $_POST['accion'];
	$correo = $_POST['correo'];

	if($accion==1){
		$con->setUsuario($usuario);
		$con->setContrasena($contrasenia);

		$validar = $con->cantidadRegistros("select * from usuario where usuario = '$usuario' and contrasenia = '$contrasenia'");

		if($validar>0){
			$_SESSION['usuario'] = $usuario;
			header('Location: ./vistas.php');
		}
		else{
			header('Location: ./log-in.html');
		}
	}
	else{
		$registrar = $con->ejecutarInstruccion("insert into usuario(usuario, contrasenia, correo) values('$usuario', '$contrasenia', '$correo')");
		header('Location: ./log-in.html');
	}
?>