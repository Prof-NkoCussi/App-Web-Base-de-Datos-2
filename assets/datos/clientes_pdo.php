<?php
// ==========================================================
// clientes_pdo.php: lo mismo que clientes.php, pero con PDO
// Base de Datos II · TP N°12 · Prof. Nicolás A. Cussi
// SQL embebido en PHP, con PDO y una consulta preparada.
//
// Para probarlo: guardá este archivo en C:\xampp\htdocs\bd2\,
// iniciá Apache y MySQL en el panel de XAMPP y abrí
// http://localhost/bd2/clientes_pdo.php en el navegador.
// Necesita la base tienda: importá tienda.sql en phpMyAdmin.
// ==========================================================

// 1. Conectarse. PDO recibe en un solo texto el gestor (mysql),
//    el servidor, la base y el juego de caracteres (utf8mb4, para
//    que las tildes y la ñ lleguen bien); después, el usuario y la
//    contraseña. Para otro gestor, cambia solo ese texto.
//    Si no se puede conectar, PDO lanza una excepción: try / catch
//    la atrapa y muestra un mensaje propio en lugar del error de PHP.
try {
    $conexion = new PDO("mysql:host=localhost;dbname=tienda;charset=utf8mb4", "root", "");
} catch (PDOException $e) {
    die("No se pudo conectar con la base: " . $e->getMessage());
}

// 2. Preparar la consulta: el ? marca el lugar del dato.
$ciudad = "Ushuaia";   // en un programa real, la escribiría el usuario
$sql = "SELECT nombre, edad FROM clientes WHERE ciudad = ?";
$consulta = $conexion->prepare($sql);

// 3 y 4. Pasarle los datos y ejecutarla, en un solo paso:
//    execute() recibe los datos en una lista, en el orden de los ?.
$consulta->execute([$ciudad]);

// 5 y 6. Recorrer los resultados y mostrarlos. Con PDO no hace falta
//    get_result(): fetch() da una fila por vez (PDO::FETCH_ASSOC: con
//    el nombre de cada columna) y false cuando no quedan más.
echo "<h1>Clientes de $ciudad</h1><ul>";
while ($fila = $consulta->fetch(PDO::FETCH_ASSOC)) {
    echo "<li>" . $fila["nombre"] . ", ";
    echo $fila["edad"] . " años</li>";
}
echo "</ul>";

$conexion = null;   // cerrar la conexión
