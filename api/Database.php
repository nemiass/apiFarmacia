<?php

namespace api;

use PDO;

class Database
{
    private $host;
    private $db;
    private $user;
    private $password;
    private $charset;
    private $pdo;

    public function __construct()
    {
        //$this->host = "fdb27.runhosting.com";
        //$this->db = "3544998_nemias";
        //$this->user = "3544998_nemias";
        //$this->password = "saicarg2020";
        //$this->charset = "utf8";
        $this->host = "localhost";
        $this->db = "farmacia";
        $this->user = "root";
        $this->password = "";
        $this->charset = "utf8";
    }

    public function connect()
    {
        try {
            $connection = "mysql:host=" . $this->host . ";dbname=" . $this->db . ";charset=" . $this->charset;
            $options = [
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                PDO::ATTR_EMULATE_PREPARES => false,
                PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'utf8'"
            ];
            $pdo = new PDO($connection, $this->user, $this->password, $options);
            return $pdo;
        } catch (\PDOException $e) {
            print_r("Error conection: " . $e->getMessage());
        }
    }

    public function close()
    {
        return $this->pdo = null;
    }
}
