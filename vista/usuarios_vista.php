<?php include 'plantillas/header.php'; ?>
	<section class="main">
		<div class="wrapp">
			<?php include 'plantillas/nav.php'; ?>
				<article>
					<div class="mensaje">
						<h2>USUARIOS</h2>
					</div>
					<a class="agregar" href="registrarusuarios.php">Agregar Usuarios</a>
						<table class="tabla">
						  <tr>
							<th>Nombres</th>
							<th>Apellidos</th>
              <th>Usuario</th>
							<th>Cargo</th>
              <th colspan="2">Opciones</th>
						  </tr>
					</table>
				</article>
	</section>
<?php include 'plantillas/footer.php'; ?>
</body>
</html>