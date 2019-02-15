
<?php include 'plantillas/header.php'; ?>
	<section class="main">
		<div class="wrapp">
			<?php include 'plantillas/nav.php'; ?>
				<article>
					<div class="mensaje">
						<h2>INVENTARIO</h2>
					</div>
						<a class="agregar" href="">Agregar producto</a>
						
						<table class="tabla">
						  <tr>
							<th>Identificacion</th>
							<th>Nombre</th>
							<th>Precio</th>
                            <th>Fecha Vencimiento</th>
                            <th>Cantidad</th>
							<th>Descripción</th>
							<th>Unidad</th>
							<th colspan ="2">Opciones</th>
						  </tr>
						</table>
				</article>
	</section>
<?php include 'plantillas/footer.php'; ?>
</body>
</html>