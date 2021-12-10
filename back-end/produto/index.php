<?php

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");
header("Content-Type: application/json");

require("../Connection.php");
require("../model/ModelProdutos.php");
require("../controller/ControllerProdutos.php");

$conn = new Connection();
$modelProdutos = new ModelProdutos($conn->returnConnection());
$controller = new ControllerProdutos($modelProdutos);
$dados = $controller->router();

echo json_encode(array("staus" => "Success", "data" => $dados));
