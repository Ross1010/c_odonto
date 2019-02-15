
<?php include 'plantillas/header.php'; ?>
	<section class="main">
		<div class="wrapp">
			<?php include 'plantillas/nav.php'; ?>
				<article>
					<div class="mensaje">
						<h2>CITAS</h2>
					</div>
					<a class="agregar" href="agregarcitas.php">Agregar Citas</a>
					<table class="tabla">
						  <tr>
							<th>#</th>
							<th>Fecha</th>
							<th>Hora Inicio</th>
							<th>Hora Fin</th>
							<th>Paciente</th>
							<th>Odontólgo</th>
							<th>Observaciones</th>
							<th>Estado</th>
							<th colspan="2">Opciones</th>
						  </tr>
						</table>	 
				</article>
	</section>
<?php include 'plantillas/footer.php'; ?>
</body>
</html>