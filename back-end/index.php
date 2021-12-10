<?php
require("./Connection.php");
// require("./model/ModelClientes.php");

// $conn = new Connection();
// $modelClientes = new ModelClientes($conn->returnConnection());

// $dados = $modelCliente->findAll();

// echo '<pre>';
// var_dump($dados);
// echo '</pre>';

// -----------------------------------------------------------------------

// require("./model/ModelCategorias.php");

// $conn = new Connection();
// $modelCategorias = new ModelCategorias($conn->returnConnection());

// $dados = $modelCategorias->findAll();

// echo '<pre>';
// var_dump($dados);
// echo '</pre>';

// -----------------------------------------------------------------------

require("./model/ModelProdutos.php");

$conn = new Connection();
$modelProdutos = new ModelProdutos($conn->returnConnection());

$dados = $modelProdutos->findAll();

echo '<pre>';
var_dump($dados);
echo '</pre>';