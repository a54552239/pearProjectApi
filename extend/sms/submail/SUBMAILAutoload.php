<?PHP
    
    /*
     |--------------------------------------------------------------------------
     | SUBMAIL SDK autoloader.
     |--------------------------------------------------------------------------
     | SUBMAIL SDK Version 1.0.1 --PHP
     | copyright 2011 - 2014 SUBMAIL
     |--------------------------------------------------------------------------
     */
    
    function SUBMAILAutoload($classname){
        $filename = dirname(__FILE__).DIRECTORY_SEPARATOR.'lib/'.strtolower($classname).'.php';
        if (is_readable($filename)) {
            require $filename;
        }
    }
    
    if (version_compare(PHP_VERSION, '5.1.2', '>=')) {
        if (version_compare(PHP_VERSION, '5.3.0', '>=')) {
            spl_autoload_register('SUBMAILAutoload', true, true);
        } else {
            spl_autoload_register('SUBMAILAutoload');
        }
    } else {
        //function __autoload($classname){
        function spl_autoload_register($classname){
            SUBMAILAutoload($classname);
        }
    }
