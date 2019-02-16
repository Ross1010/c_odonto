
<?php include 'vista/plantillas/header.php'; ?>
	<section class="main">
		<div class="wrapp">
			<?php include 'vista/plantillas/nav.php'; ?>
				<article>
					<div class="mensaje">
						<h2>ODONTÓLOGOS</h2>
					</div>
                    <form class="form-control col-lg-12" style="max-width: 80%">
                        Primer Nombre
                        <input type="text" placeholder="Ingrese su primer nombre"><br><br>
                        Segundo Nombre
                        <input type="text" placeholder="Ingrese su segundo nombre"><br><br>
                        Primer Apellido
                        <input type="text" placeholder="Ingrese su primer apellido"><br><br>
                        Segundo Apellido
                        <input type="text" placeholder="Ingrese su segundo apellido"><br><br>
                        Número de empleado
                        <input type="text" placeholder="Ingrese su número de empleado"><br><br>
                        Fecha Nacimiento
                        <input type="date"><br><br>
                        Correo
                        <input type="email" placeholder="Ingrese su correo"><br><br>
                        Estado Civil
                        <input type="text" placeholder="Ingrese su estado civil"><br><br>
                        Dirección
                        <textarea  placeholder="Introduzca su dirección" size="100" ></textarea>
                        Número Identidad
                        <input type="text" placeholder="Ingrese su número de identidad"><br><br>
                        Teléfono
                        <input type="text" placeholder="Ingrese su número de teléfono"><br><br>
                        
                        <button type="submit" class="btn" style="background-color:#14BACE;">
                            Agregar Odontólogo
                        </button>
                    </form>
				</article>
	</section>
<?php include 'vista/plantillas/footer.php'; ?>
</body>
</html>