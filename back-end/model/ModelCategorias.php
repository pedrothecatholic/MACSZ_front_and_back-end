<?php

class ModelCategorias
{

    private $conn;
    private $_idCategoria;
    private $_nome;

    public function __construct($conn)
    {
        //PERMITE RECEBER DADOS JSON ATRAVÉS DA REQUISIÇÃO 
        $json = file_get_contents("php://input");
        $dadosCategoria = json_decode($json);

        //RECEBIMENTO DOS DADOS DO POSTMAN
        $this->_idCategoria = $dadosCategoria->idCategoria ?? null;
        $this->_nome = $dadosCategoria->nome ?? null;
        $this->_conn = $conn;
    }

    public function findAll()
    {
        //MONTA A INSTRUÇÃO SQL
        $sql = "SELECT * FROM tblCategoria";

        //PREPARA UM PROCESSO DE EXECUÇÃO DE INSTRUÇÃO SQL
        $stm = $this->_conn->prepare($sql);
        //$stm->bindValue(1, $this->_idCategoria);

        //EXECUTA A INSTRUÇÃO SQL
        $stm->execute();

        //DEVOLVE OS VALORES DA SELECT PARA SEREM UTILIZADOS
        return $stm->fetchAll(\PDO::FETCH_ASSOC);
    }

    public function findById()
    {
        $sql = "SELECT * FROM tblCategoria WHERE idCategoria = ?";

        $stm = $this->_conn->prepare($sql);
        $stm->bindValue(1, $this->_idCategoria);

        $stm->execute();

        return $stm->fetchAll(\PDO::FETCH_ASSOC);
    }

    public function create()
    {
        $sql = "INSERT INTO tblCategoria (nome)
        VALUES (?)";

        // $extensao = pathinfo($this->_fotografia, PATHINFO_EXTENSION);
        // $novoNomeArquivo = md5(microtime()) . ".$extensao";

        // move_uploaded_file($_FILES["fotografia"]["tmp_name"], "../upload/$novoNomeArquivo");

        $stm = $this->_conn->prepare($sql);

        $stm->bindValue(1, $this->_nome);
        // $stm->bindValue(5, $novoNomeArquivo);

        if ($stm->execute()) {
            return "Success";
        } else {
            return "Failed";
        }
    }

    public function delete()
    {
        $sql = "DELETE FROM tblCategoria WHERE idCategoria = ?";

        $stm = $this->_conn->prepare($sql);

        $stm->bindValue(1, $this->_idCategoria);

        if ($stm->execute()) {
            return "Dados excluídos com sucesso!";
        }
    }

    public function update()
    {
        $sql = "UPDATE tblCategoria SET 
        nome = ?
        WHERE idCategoria = ?";

        $stm = $this->_conn->prepare($sql);

        $stm->bindValue(1, $this->_nome);
        $stm->bindValue(2, $this->_idCategoria);

        if ($stm->execute()) {
            return "Dados alterados com sucesso!";
        }
    }
}
