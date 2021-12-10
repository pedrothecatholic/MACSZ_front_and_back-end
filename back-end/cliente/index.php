<?php

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");
header("Content-Type: application/json");

require("../Connection.php");
require("../model/ModelClientes.php");
require("../controller/ControllerClientes.php");

$conn = new Connection();
$modelCliente = new ModelClientes($conn->returnConnection());
$controller = new ControllerClientes($modelCliente);

$dados = $controller->router();

echo json_encode(array("staus" => "Success", "data" => $dados));
