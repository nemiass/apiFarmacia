<?php

namespace api;

use api\Farmacia;

header("Access-Control-Allow-Origin: *");

class ApiFarmacia
{
    private $farmacia;
    private $pedidos = array();
    private $productos = array();

    public function __construct()
    {
        $this->farmacia = new Farmacia;
    }

    public function login()
    {
        if (isset($_GET["u"]) and isset($_GET["p"])) {
            $user = $_GET["u"];
            $pass = $_GET["p"];
            $usuarios = array();
            $usuarios["user"] = array();

            $datos = $this->farmacia->getUser($user)->fetch();

            if ($datos) {
                if (password_verify($pass, $datos["contrasenia"])) {
                    $tipo =  $datos["tipo"];
                    $dni =  $datos["dni"];
                    $usr = $this->filtrarEjecutar($tipo, $dni);
                    $usuarios["user"] = array(
                        "nombre" => $usr["nombre"],
                        "apellido" => $usr["apellido"],
                        "dni" => $usr["dni"],
                        "telefono" => $usr["telefono"],
                        "tipo" => $tipo
                    );
                    $usuarios["response"] = "true";
                    echo json_encode($usuarios);
                    return;
                }
                echo json_encode(array(
                    "response" => "false",
                    "msg" => "user o pasword incorrecto"
                ));
                return;
            } else {
                echo json_encode(array(
                    "response" => "false",
                    "msg" => "user o pasword incorrecto"
                ));
            }
        }
    }

    public function filtrarEjecutar($tipo, $dni)
    {
        switch ($tipo) {
            case "cliente":
                $usr = $this->farmacia->getCliente($dni)->fetch();
                break;
            case "empleado":
                $usr = $this->farmacia->getEmpleado($dni)->fetch();
                break;
            case "administrador":
                $usr = $this->farmacia->getAdmin($dni)->fetch();
                break;
        }
        return $usr;
    }

    public function mostrarPedidos()
    {
        $this->pedidos["pedidos"] = array();
        $pedidos = $this->farmacia->getPedidos();

        if ($pedidos->rowCount()) {
            foreach ($pedidos as $p) {
                $item = array(
                    "fecha" => $p["fecha"],
                    "fechaEntrega" => $p["fecha_entrega"],
                    "direccion" => $p["direccion"],
                    "clienteID" => $p["id_cliente"]
                );
                array_push($this->pedidos["pedidos"], $item);
            }
            $this->pedidos["response"] = "true";
            echo json_encode($this->pedidos);
        } else {
            echo json_encode(array(
                "response" => "false",
                "msg" => "No hay pedidos"
            ));
        }
    }

    public function mostrarProductos()
    {
        $this->productos["productos"] = array();
        $productos = $this->farmacia->getProdutos();

        if ($productos->rowCount()) {
            foreach ($productos as $p) {
                $item = array(
                    "nombre" => $p["nombre"],
                    "precio" => $p["precio"],
                    "caracteristicas" => $p["caracteristicas"]
                );
                array_push($this->productos["productos"], $item);
            }
            $this->productos["response"] = "true";
            echo json_encode($this->productos);
        } else {
            echo json_encode(array(
                "response" => "false",
                "msg" => "No hay productos"
            ));
        }
    }

    public function addProductos()
    {
        if (isset($_POST)) {
            $datos = array(
                ":n" => isset($_POST["n"]) ? $_POST["n"] : "",
                ":p" => isset($_POST["p"]) ? $_POST["p"] : "",
                ":c" => isset($_POST["c"]) ? $_POST["c"] : "",
                ":id_c" => "1"
            );
            if ($this->validarPost($datos)) {
                $add = $this->farmacia->addProductos($datos);
                if ($add->rowCount()) {
                    echo json_encode(array(
                        "response" => "true",
                        "msg" => "producto agregado correctamente"
                    ));
                    return;
                }
                echo json_encode(array(
                    "response" => "false",
                    "msg" => "error al agregar productos"
                ));
            }
            echo json_encode(array(
                "response" => "false",
                "msg" => "error al agregar productoss"
            ));
        }
    }

    private function validarPost($datos)
    {
        foreach ($datos as $d => $val) {
            if ($val == "") {
                return false;
            }
            return true;
        }
    }

    public function deleteProducto()
    {
        if (isset($_GET["n"])) {
            $nombre = $_GET["n"];
            $delete = $this->farmacia->deleteProductos($nombre);

            if ($delete->rowCount()) {
                echo json_encode(array(
                    "response" => "true",
                    "msg" => "producto eliminado correctamente"
                ));
                return;
            }
            echo json_encode(array(
                "response" => "false",
                "msg" => "no se pudo eliminar el producto"
            ));
        }
    }

    public function updProducto()
    {
        if (isset($_POST)) {
            $datos = array(
                ":n" => isset($_POST["n"]) ? $_POST["n"] : "",
                ":p" => isset($_POST["p"]) ? $_POST["p"] : "",
                ":c" => isset($_POST["c"]) ? $_POST["c"] : "",
                ":idp" => isset($_POST["idp"]) ? $_POST["idp"] : ""
            );

            if ($this->validarPost($datos)) {
                $add = $this->farmacia->updateProductos($datos);
                if ($add->rowCount()) {
                    echo json_encode(array(
                        "response" => "true",
                        "msg" => "producto actualizado correctamente"
                    ));
                    return;
                }
                echo json_encode(array(
                    "response" => "false",
                    "msg" => "error al actualizar producto"
                ));
                return;
            }
            echo json_encode(array(
                "response" => "false",
                "msg" => "error al actualizar producto"
            ));
        }
    }

    public function traerProducto()
    {
        $producto = array();
        if (isset($_GET["n"])) {
            $nombre = $_GET["n"];
            $resp = $this->farmacia->getProdcuto($nombre)->fetch();

            if ($resp) {
                $producto["producto"] = array(
                    "id_producto" => $resp["id_producto"],
                    "nombre" => $resp["nombre"],
                    "precio" => $resp["precio"],
                    "caracteristicas" => $resp["caracteristicas"]
                );
                $producto["response"] = "true";
                echo json_encode($producto);
                return;
            }

            echo json_encode(array(
                "response" => "false",
                "msg" => "producto no encontrado"
            ));
        }
    }
}
