<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Document</title>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<!-- borrar el style xD -->
	<style>
		body {
  background: #4cbda7;
}

ul {
  position: absolute;
	margin: auto;
	top: 0; left: 0; bottom: 0; right: 0;  
  width: 150px;
  height: 150px;
  padding: 0;
  list-style: none;
}

li {
  position: absolute;
  width: 150px ;
  height: 150px ;
  border-radius: 5px;
  background: #fad335;
  opacity: 0.8;
}

li:nth-child(2) {
  animation:         rotation1 3s infinite;  
  -o-animation:      rotation1 3s infinite;
  -moz-animation:    rotation1 3s infinite;
  -webkit-animation: rotation1 3s infinite;
}

li:nth-child(3) {
  animation:         rotation2 3s infinite;  
  -o-animation:      rotation2 3s infinite;
  -moz-animation:    rotation2 3s infinite;
  -webkit-animation: rotation2 3s infinite;
  animation-delay:         0.2s;
	-o-animation-delay:      0.2s;
	-moz-animation-delay:    0.2s;
  -webkit-animation-delay: 0.2s;
}

li:nth-child(4) {
  animation:         rotation3 3s infinite;  
  -o-animation:      rotation3 3s infinite;
  -moz-animation:    rotation3 3s infinite;
  -webkit-animation: rotation3 3s infinite;
  animation-delay:         0.4s;
	-o-animation-delay:      0.4s;
	-ms-animation-delay:     0.4s;
	-moz-animation-delay:    0.4s;
  -webkit-animation-delay: 0.4s;
}

/* first rotation */
@keyframes rotation1 {
	from     { transform:rotate(-360deg); }
  30%,60%  { transform:rotate(20deg); }
  80%      { transform:rotate(0); }
}
@-o-keyframes rotation1 {
	from     { -o-transform:rotate(-360deg); }
  30%,60%  { -o-transform:rotate(20deg); }
  80%      { -o-transform:rotate(0); }
}
@-moz-keyframes rotation1 {
	from     { -moz-transform:rotate(-360deg); }
  30%,60%  { -moz-transform:rotate(20deg); }
  80%      { -moz-transform:rotate(0); }
}
@-webkit-keyframes rotation1 {
	from     { -webkit-transform:rotate(-360deg); }
  30%,60%  { -webkit-transform:rotate(20deg); }
  80%      { -webkit-transform:rotate(0); }
}

/* second rotation */
@keyframes rotation2 {
	from     { transform:rotate(-360deg); }
  30%, 60% { transform:rotate(45deg); }
  80%      { transform:rotate(0); }
}
@-o-keyframes rotation2 {
	from     { -o-transform:rotate(-360deg); }
  30%, 60% { -o-transform:rotate(45deg); }
  80%      { -o-transform:rotate(0); }
}
@-moz-keyframes rotation2 {
	from     { -moz-transform:rotate(-360deg); }
  30%, 60% { -moz-transform:rotate(45deg); }
  80%      { -moz-transform:rotate(0); }
}
@-webkit-keyframes rotation2 {
	from     { -webkit-transform:rotate(-360deg); }
  30%, 60% { -webkit-transform:rotate(45deg); }
  80%      { -webkit-transform:rotate(0); }
}

/* third rotation */
@keyframes rotation3 {
	from    { transform:rotate(-360deg); }
  30%,60% { transform:rotate(75deg); }
  80%     { transform:rotate(0); }
}
@-o-keyframes rotation3 {
	from    { -o-transform:rotate(-360deg); }
  30%,60% { -o-transform:rotate(75deg); }
  80%     { -o-transform:rotate(0); }
}
@-moz-keyframes rotation3 {
	from    { -moz-transform:rotate(-360deg); }
  30%,60% { -moz-transform:rotate(75deg); }
  80%     { -moz-transform:rotate(0); }
}
@-webkit-keyframes rotation3 {
	from    { -webkit-transform:rotate(-360deg); }
  30%,60% { -webkit-transform:rotate(75deg); }
  80%     { -webkit-transform:rotate(0); }
}
	</style>
</head>
<body>
	En prueba xD
	<ul>
	  <li></li>
	  <li></li>
	  <li></li>
	  <li></li>
	</ul>
	<script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>