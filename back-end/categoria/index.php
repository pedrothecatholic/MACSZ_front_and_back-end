<?php

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");
header("Content-Type: application/json");

require("../Connection.php");
require("../model/ModelCategorias.php");
require("../controller/ControllerCategorias.php");

$conn = new Connection();
$modelCategoria = new ModelCategorias($conn->returnConnection());
$controller = new ControllerCategorias($modelCategoria);

$dados = $controller->router();

echo json_encode(array("staus" => "Success", "data" => $dados));
