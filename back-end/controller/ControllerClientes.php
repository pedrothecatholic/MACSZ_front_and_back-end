<?php

class ControllerClientes
{

    private $_method;
    private $_modelClientes;
    private $_idCliente;

    public function __construct($model)
    {
        $this->_modelClientes = $model;
        $this->_method = $_SERVER['REQUEST_METHOD'];

        //PERMITE RECEBER DADOS JSON ATRAVÉS DA REQUISIÇÃO 
        $json = file_get_contents("php://input");
        $dadosCliente = json_decode($json);

        $this->_idCliente = $dadosCliente->idCliente ?? null;
    }

    function router()
    {
        switch ($this->_method) {
            case 'GET':

                if (isset($this->_idCliente)) {
                    return $this->_modelClientes->findById();
                }

                return $this->_modelClientes->findAll();
                break;

            case 'POST':
                return $this->_modelClientes->create();
                break;

            case 'PUT':
                return $this->_modelClientes->update();
                break;

            case 'DELETE':
                return $this->_modelClientes->delete();
                break;

            default:
                # code...
                break;
        }
    }
}
