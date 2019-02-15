<aside>
	<div class="widget">
		<?php require_once('./class/class-conexion.php');
	 	  $con = new Conexion();

	 	  $rs = $con->ejecutarInstruccion("select * from categoria;");

	 	  while($cat = mysqli_fetch_array($rs)){?>
 	  	  <a href="<?php echo $cat['tipoProducto'].'.php'; ?>" title="Citas"><?php echo $cat['descripcion']; ?></a>
 	  	<?php } ?>
	</div>
</aside>