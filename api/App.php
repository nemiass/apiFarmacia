<?php

namespace api;

use api\Farmacia;
use api\ApiFarmacia;

class App
{
    private $url;
    private $class = "ApiFarmacia";
    private $method = false;

    public function __construct()
    {
        if (isset($_GET["url"])) {
            $this->url = rtrim($_GET["url"], "/");
            $this->url = explode("/", $this->url);
            $this->class = array_shift($this->url);

            if(count($this->url)) {
                $this->method = array_shift($this->url);
            }
            
            $this->loadClass();
            $this->loadMethod();
        }
    }

    public function loadClass()
    {
        if(file_exists("api/".$this->class.".php")) {
            $this->class = new ApiFarmacia;
            return;
        }
        exit();
    }

    public function loadMethod()
    {
        if(method_exists($this->class, $this->method)) {
            $this->class->{$this->method}();
            return;
        }
    } 
}
