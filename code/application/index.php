<?php

    define('PATH_ROOT', str_replace("application/index.php", "", $_SERVER["SCRIPT_FILENAME"]));
    define('PATH_FILES', PATH_ROOT."files");
    define('PATH_APPLICATION_ROOT', str_replace("index.php", "", $_SERVER["SCRIPT_FILENAME"]));
    define('PATH_VIEWS', PATH_APPLICATION_ROOT."views");
    define('PATH_CONTROLLERS', PATH_APPLICATION_ROOT."controllers");
    define('PATH_MODELS', PATH_APPLICATION_ROOT."models");
    define('PATH_DTO', PATH_APPLICATION_ROOT."DTO");
    define('PATH_CORE', PATH_APPLICATION_ROOT."core");
    define('PATH_ROUTER', PATH_APPLICATION_ROOT."router");
    define('PATH_PARSER', PATH_APPLICATION_ROOT."parser");
    define('PATH_EXCEPTION', PATH_APPLICATION_ROOT."exception");
    define('PATH_SERVICE', PATH_APPLICATION_ROOT."services");
    define('PATH_PUBLIC', "public");
    require(PATH_APPLICATION_ROOT . 'dispatcher.php');


  
    $Dispatcher = new Dispatcher();
    $Dispatcher->dispatch();
?>