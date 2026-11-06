<?php
// ==========================================================
// clientes.php: los clientes de una ciudad, sacados de la base tienda
// Base de Datos II · TP N°12 · Prof. Nicolás A. Cussi
// SQL embebido en PHP, con mysqli y una consulta preparada (lámina 40).
//
// Para probarlo: guardá este archivo en C:\xampp\htdocs\bd2\,
// iniciá Apache y MySQL en el panel de XAMPP y abrí
// http://localhost/bd2/clientes.php en el navegador.
// Necesita la base tienda: importá tienda.sql en phpMyAdmin.
// ==========================================================

// 1. Conectarse: el servidor, el usuario, la contraseña y la base.
//    El usuario root sin contraseña es solo para el laboratorio:
//    en el TP13 se crean usuarios con permisos.
//    Si no se puede conectar (por ejemplo, MySQL está apagado),
//    PHP muestra un error y el programa se corta.
$conexion = new mysqli("localhost", "root", "", "tienda");
$conexion->set_charset("utf8mb4");   // para que las tildes y la ñ lleguen bien

// 2. Preparar la consulta: el ? marca el lugar del dato.
$ciudad = "Ushuaia";   // en un programa real, la escribiría el usuario
$sql = "SELECT nombre, edad FROM clientes WHERE ciudad = ?";
$consulta = $conexion->prepare($sql);

// 3. Pasarle los datos: "s" indica que el dato es un texto (string).
//    El dato nunca se pega directo en el SQL: va con ? y bind_param.
$consulta->bind_param("s", $ciudad);

// 4. Ejecutarla: el gestor resuelve la consulta.
$consulta->execute();

// 5. Recorrer los resultados: fetch_assoc() da una fila por vez,
//    con el nombre de cada columna, y null cuando no quedan más.
// 6. Mostrarlos en la página, uno en cada renglón de la lista.
$resultado = $consulta->get_result();
echo "<h1>Clientes de $ciudad</h1><ul>";
while ($fila = $resultado->fetch_assoc()) {
    echo "<li>" . $fila["nombre"] . ", ";
    echo $fila["edad"] . " años</li>";
}
echo "</ul>";

$conexion->close();   // cerrar la conexión
