
<?php include 'vista/plantillas/header.php'; ?>
	<section class="main">
		<div class="wrapp">
			<?php include 'vista/plantillas/nav.php'; ?>
				<article>
					<div class="mensaje">
						<h2>CITAS</h2>
					</div>
                    <form class="form-control col-lg-12" style="max-width: 80%">
                        Fecha
                        <input type="date" placeholder="Fecha"><br><br>
                        Hora Inicio
                        <input type="time"><br><br>
                        Hora Fin
                        <input type="time"><br><br>
                        Observación
                        <textarea  placeholder="Introduzca su observación" size="100" id="txt-observacion" name="txt-observacion"></textarea>

                        Odontólogo
                        <select id="odontologo">
                        <option value="-">Seleccione un odontólogo</option>
                        <option value="1">opcion1</option>
                        <option value="2">opcion2</option>
                        <option value="3">opcion3</option>
                        <option value="4">etc</option>
                        </select><br><br>

                        Servicio
                        <select id="servicio">
                        <option value="-">Seleccione un servicio</option>
                        <option value="1">opcion1</option>
                        <option value="2">opcion2</option>
                        <option value="3">opcion3</option>
                        <option value="4">etc</option>
                        </select><br><br>

                        Paciente
                        <select id="servicio">
                        <option value="-">Seleccione un paciente</option>
                        <option value="1">opcion1</option>
                        <option value="2">opcion2</option>
                        <option value="3">opcion3</option>
                        <option value="4">etc</option>
                        </select><br><br>

                        <button type="submit" class="btn" style="background-color:#14BACE;">
                            Agregar Cita
                        </button>
                    </form>
				</article>
	</section>
<?php include 'vista/plantillas/footer.php'; ?>
</body>
</html>