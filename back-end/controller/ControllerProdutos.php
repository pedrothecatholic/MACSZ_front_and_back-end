<?php

class ControllerProdutos
{

    private $_method;
    private $_modelProdutos;
    private $_idProduto;

    public function __construct($model)
    {
        $this->_modelProdutos = $model;
        $this->_method = $_SERVER['REQUEST_METHOD'];

        //PERMITE RECEBER DADOS JSON ATRAVÉS DA REQUISIÇÃO 
        $json = file_get_contents("php://input");
        $dadosProduto = json_decode($json);



        $this->_idProduto = $dadosProduto->idProduto ?? null;
    }

    function router()
    {
        switch ($this->_method) {
            case 'GET':

                if (isset($this->_idProduto)) {
                    return $this->_modelProdutos->findById();
                }

                return $this->_modelProdutos->findAll();
                break;

            case 'POST':

                if (isset($_POST["idProduto"])) {
                    return $this->_modelProdutos->update();
                }

                return $this->_modelProdutos->create();
                break;

            case 'PUT':
                return $this->_modelProdutos->update();
                break;

            case 'DELETE':
                return $this->_modelProdutos->delete();
                break;

            default:
                # code...
                break;
        }
    }
}
