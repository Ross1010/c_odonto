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

		$validar = $con->cantidadRegistros("select * from empleado where usuario = '$usuario' and contrasena = '$contrasenia'");

		if($validar>0){
			$_SESSION['usuario'] = $usuario;
			header('Location: ./vistas.php');
		}
		else{
			header('Location: ./log-in.html');
		}
	}
	else{
		$registrar = $con->ejecutarInstruccion("insert into empleado(usuario, contrasena) values('$usuario', '$contrasenia')");
		header('Location: ./log-in.html');
	}
?>