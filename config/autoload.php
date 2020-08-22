<?php

define('ROOT', dirname(__FILE__, 2));
define('DS', DIRECTORY_SEPARATOR);
//mejorado
spl_autoload_register(function ($nombre_clase) {
    $ruta = ROOT . DS . str_replace("\\", DS, $nombre_clase) . '.php';
    if (file_exists($ruta)) {
        include_once($ruta);
    } else {
        throw new Exception("Error al cargar la clase -->" . $ruta);
    }
});
