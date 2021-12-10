<?php

class ModelClientes
{

    private $conn;
    private $_idCliente;
    private $_nome;
    private $_cpf;
    private $_dataNasc;
    private $_dataCadastro;
    private $_email;
    private $_senha;

    public function __construct($conn)
    {
        //PERMITE RECEBER DADOS JSON ATRAVÉS DA REQUISIÇÃO 
        $json = file_get_contents("php://input");
        $dadosCliente = json_decode($json);

        //RECEBIMENTO DOS DADOS DO POSTMAN
        $this->_idCliente = $dadosCliente->idCliente ?? null;
        $this->_nome = $dadosCliente->nome ?? null;
        $this->_cpf = $dadosCliente->cpf ?? null;
        $this->_dataNasc = $dadosCliente->dataNasc ?? null;
        $this->_dataCadastro = $dadosCliente->dataCadastro ?? null;
        $this->_email = $dadosCliente->email ?? null;
        $this->_senha = $dadosCliente->senha ?? null;
        $this->_conn = $conn;
    }

    public function findAll()
    {
        //MONTA A INSTRUÇÃO SQL
        // $sql = "SELECT * FROM tblCliente WHERE idCliente = ?";
        $sql = "SELECT * FROM tblCliente";

        //PREPARA UM PROCESSO DE EXECUÇÃO DE INSTRUÇÃO SQL
        $stm = $this->_conn->prepare($sql);
        //$stm->bindValue(1, $this->_idCliente);

        //EXECUTA A INSTRUÇÃO SQL
        $stm->execute();

        //DEVOLVE OS VALORES DA SELECT PARA SEREM UTILIZADOS
        return $stm->fetchAll(\PDO::FETCH_ASSOC);
    }

    public function findById()
    {
        $sql = "SELECT * FROM tblCliente WHERE idCliente = ?";

        $stm = $this->_conn->prepare($sql);
        $stm->bindValue(1, $this->_idCliente);

        $stm->execute();

        return $stm->fetchAll(\PDO::FETCH_ASSOC);
    }

    public function create()
    {
        $sql = "INSERT INTO tblCliente (nome, cpf, dataNasc, dataCadastro, email, senha)
        VALUES (?, ?, ?, ?, ?, ?)";

        // $extensao = pathinfo($this->_fotografia, PATHINFO_EXTENSION);
        // $novoNomeArquivo = md5(microtime()) . ".$extensao";

        // move_uploaded_file($_FILES["fotografia"]["tmp_name"], "../upload/$novoNomeArquivo");

        $stm = $this->_conn->prepare($sql);

        $stm->bindValue(1, $this->_nome);
        $stm->bindValue(2, $this->_cpf);
        $stm->bindValue(3, $this->_dataNasc);
        $stm->bindValue(4, $this->_dataCadastro);
        $stm->bindValue(5, $this->_email);
        $stm->bindValue(6, $this->_senha);
        // $stm->bindValue(5, $novoNomeArquivo);

        if ($stm->execute()) {
            return "Success";
        } else {
            return "Failed";
        }
    }

    public function delete()
    {
        $sql = "DELETE FROM tblCliente WHERE idCliente = ?";

        $stm = $this->_conn->prepare($sql);

        $stm->bindValue(1, $this->_idCliente);

        if ($stm->execute()) {
            return "Dados excluídos com sucesso!";
        }
    }

    public function update()
    {
        $sql = "UPDATE tblCliente SET 
        nome = ?,
        cpf = ?,
        dataNasc = ?,
        dataCadastro = ?,
        email = ?,
        senha = ?
        WHERE idCliente = ?";

        $stm = $this->_conn->prepare($sql);

        $stm->bindValue(1, $this->_nome);
        $stm->bindValue(2, $this->_cpf);
        $stm->bindValue(3, $this->_dataNasc);
        $stm->bindValue(4, $this->_dataCadastro);
        $stm->bindValue(5, $this->_email);
        $stm->bindValue(6, $this->_senha);
        $stm->bindValue(7, $this->_idCliente);

        if ($stm->execute()) {
            return "Dados alterados com sucesso!";
        }
    }
}
