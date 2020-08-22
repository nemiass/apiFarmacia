<?php

namespace api;

use api\Database;

class Farmacia extends Database
{
    public function getUser($user)
    {
        $query = $this->connect()->prepare("SELECT * FROM usuarios where usuario = :u");
        $query->execute([":u" => $user]);
        return $query;
    }

    public function getEmpleado($dni)
    {
        $query = $this->connect()->prepare("SELECT * FROM empleado where dni = :d");
        $query->execute([":d" => $dni]);
        return $query;
    }

    public function getAdmin($dni)
    {
        $query = $this->connect()->prepare("SELECT * FROM administrador where dni = :d");
        $query->execute([":d" => $dni]);
        return $query;
    }

    public function getCliente($dni)
    {
        $query = $this->connect()->prepare("SELECT * FROM cliente where dni = :d");
        $query->execute([":d" => $dni]);
        return $query;
    }

    public function getPedidos()
    {
        $query = $this->connect()->query("SELECT * FROM pedido");
        return $query;
    }

    public function getProdutos()
    {
        $query = $this->connect()->query("SELECT * FROM producto");
        return $query;
    }

    public function addProductos($datos)
    {
        $query = $this->connect()->prepare(
            "INSERT INTO producto(nombre, precio, caracteristicas, id_catalogo)
            VALUES (:n, :p, :c, :id_c)"
        );
        $query->execute($datos);
        return $query;
    }

    public function updateProductos($datos)
    {
        $query = "UPDATE producto
        SET nombre=:n, precio=:p, caracteristicas =:c
        WHERE id_producto=:idp";

        $stm = $this->connect()->prepare($query);
        $stm->execute($datos);
        return $stm;
    }

    public function deleteProductos($nom)
    {
        $sql = $this->connect()->prepare(
            "DELETE FROM producto WHERE nombre = :n"
        );
        $sql->execute([":n" => $nom]);
        return $sql;
    }

    public function getProdcuto($nom)
    {
        $query = $this->connect()->prepare("SELECT * FROM producto WHERE nombre = :n");
        $query->execute([":n" => $nom]);
        return $query;
    }

    public function hacerPedido($datos, $id_cli)
    {
        $query = $this->connect()->prepare(
            "INSERT INTO pedido(fecha. fecha_entrega, direccion, estado)
            VALUES (:f, :fe, :d, :e, :id_cli)"
        );
        $query->execute($datos);
        return $query;
    }
}
