<?php

class ModelProdutos
{

    private $conn;
    private $_idProduto;
    private $_nome;
    private $_foto;
    private $_preco;
    private $_descricao;
    private $_qntde;
    private $_desconto;
    private $_idCategoria;

    public function __construct($conn)
    {
        //PERMITE RECEBER DADOS JSON ATRAVÉS DA REQUISIÇÃO 
        $json = file_get_contents("php://input");
        $dadosProduto = json_decode($json);

        //RECEBIMENTO DOS DADOS DO POSTMAN
        $this->_idProduto = $dadosProduto->idProduto ?? null;
        $this->_nome = $dadosProduto->nome ?? null;
        $this->_foto = $dadosProduto->foto ?? null;
        $this->_preco = $dadosProduto->preco ?? null;
        $this->_descricao = $dadosProduto->descricao ?? null;
        $this->_qntde = $dadosProduto->qntde ?? null;
        $this->_desconto = $dadosProduto->desconto ?? null;
        $this->_idCategoria = $dadosProduto->idCategoria ?? null;
        $this->_conn = $conn;

        // var_dump($_POST);exit;
    }

    public function findAll()
    {
        //MONTA A INSTRUÇÃO SQL
        $sql = "SELECT * FROM tblProduto";

        //PREPARA UM PROCESSO DE EXECUÇÃO DE INSTRUÇÃO SQL
        $stm = $this->_conn->prepare($sql);

        //EXECUTA A INSTRUÇÃO SQL
        $stm->execute();

        //DEVOLVE OS VALORES DA SELECT PARA SEREM UTILIZADOS
        return $stm->fetchAll(\PDO::FETCH_ASSOC);
    }

    public function findById()
    {
        $sql = "SELECT * FROM tblProduto WHERE idProduto = ?";

        $stm = $this->_conn->prepare($sql);
        $stm->bindValue(1, $this->_idProduto);

        $stm->execute();

        return $stm->fetchAll(\PDO::FETCH_ASSOC);
    }

    //CREATE COM ERROS
    public function create()
    {
        $sql = "INSERT INTO tblProduto (nome, foto, preco, descricao, qntde, desconto, idCategoria)
        VALUES (?, ?, ?, ?, ?, ?, ?)";

        $nome = $_POST["nome"];
        $preco = $_POST["preco"];
        $descricao = $_POST["descricao"];
        $qntde = $_POST["qntde"];
        $desconto = $_POST["desconto"];
        $idCategoria = $_POST["idCategoria"];
        $foto = $_FILES["foto"]["name"];

        // echo $nome;
        // echo $preco;
        // echo $descricao;
        // echo $qntde;
        // echo $desconto;
        // echo $idCategoria;
        // var_dump($foto);
        // exit;

        $extensao = pathinfo($foto, PATHINFO_EXTENSION);

        //echo $extensao;exit;
        $novoNomeArquivo = md5(microtime()) . ".$extensao";
        //echo $novoNomeArquivo;exit;
        move_uploaded_file($_FILES["foto"]["tmp_name"], "../upload/$novoNomeArquivo");

        $stm = $this->_conn->prepare($sql);

        $stm->bindValue(1, $nome);
        $stm->bindValue(2, $novoNomeArquivo);
        $stm->bindValue(3, $preco);
        $stm->bindValue(4, $descricao);
        $stm->bindValue(5, $qntde);
        $stm->bindValue(6, $desconto);
        $stm->bindValue(7, $idCategoria);

        if ($stm->execute()) {
            return "Success";
        } else {
            return "Failed";
        }
    }

    public function delete()
    {
        $sql = "DELETE FROM tblProduto WHERE idProduto = ?";

        $stm = $this->_conn->prepare($sql);

        $stm->bindValue(1, $this->_idProduto);

        if ($stm->execute()) {
            return "Dados excluídos com sucesso!";
        }
    }

    public function update()
    {

        $nome = $_POST["nome"];
        $preco = $_POST["preco"];
        $descricao = $_POST["descricao"];
        $qntde = $_POST["qntde"];
        $desconto = $_POST["desconto"];
        $idCategoria = $_POST["idCategoria"];
        $foto = $_FILES["foto"]["name"];
        $idProduto = $_POST["idProduto"];

        /* UPDATE IMAGEM */
        if ($_FILES["foto"]["error"] != UPLOAD_ERR_NO_FILE) {
            $sqlImagem = "SELECT foto FROM tblProduto WHERE idProduto = ?";
            $stm = $this->_conn->prepare($sqlImagem);

            $stm->bindValue(1, $idProduto);

            $stm->execute();

            $produto = $stm->fetchAll(\PDO::FETCH_ASSOC);

            // var_dump($produto[0]["foto"]);exit;

            //EXCLUSÃO DA FOTO ANTIGA DA PASTA
            unlink("../upload/" . $produto[0]["foto"]);

            $nomeArquivo = $_FILES["foto"]["name"];
            $extensao = pathinfo($nomeArquivo, PATHINFO_EXTENSION);
            $novoNomeArquivo = md5(microtime()) . "." . "$extensao";

            move_uploaded_file($_FILES["foto"]["tmp_name"], "../upload/$novoNomeArquivo");
        }

        /* UPDATE BANCO */
        $sql = "UPDATE tblProduto SET 
        nome = ?,
        preco = ?,
        descricao = ?,
        qntde = ?,
        desconto = ?,
        idCategoria = ?,
        foto = ?
        WHERE idProduto = ?";

        $stm = $this->_conn->prepare($sql);

        $stm->bindValue(1, $nome);
        $stm->bindValue(2, $preco);
        $stm->bindValue(3, $descricao);
        $stm->bindValue(4, $qntde);
        $stm->bindValue(5, $desconto);
        $stm->bindValue(6, $idCategoria);
        $stm->bindValue(7, $novoNomeArquivo);
        $stm->bindValue(8, $idProduto);

        if ($stm->execute()) {
            return "Dados alterados com sucesso!";
        }
    }
}
