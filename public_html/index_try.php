<?php

echo 'More Info Coming Soon';
/*
class pdo_dblib_mssql{

    private $db;
       private $cTransID;
       private $childTrans = array();

    public function __construct($hostname, $port, $dbname, $username, $pwd){

        $this->hostname = $hostname;
        $this->port = $port;
        $this->dbname = $dbname;
        $this->username = $username;
        $this->pwd = $pwd;

        $this->connect();
       
    }

    public function beginTransaction(){

        $cAlphanum = "AaBbCc0Dd1EeF2fG3gH4hI5iJ6jK7kLlM8mN9nOoPpQqRrSsTtUuVvWwXxYyZz";
        $this->cTransID = "T".substr(str_shuffle($cAlphanum), 0, 7);

        array_unshift($this->childTrans, $this->cTransID);

        $stmt = $this->db->prepare("BEGIN TRAN [$this->cTransID];");
        return $stmt->execute();

    }

    public function rollBack(){
       
        while(count($this->childTrans) > 0){
            $cTmp = array_shift($this->childTrans);
            $stmt = $this->db->prepare("ROLLBACK TRAN [$cTmp];");
            $stmt->execute();
        }

        return $stmt;
    }

    public function commit(){

        while(count($this->childTrans) > 0){
            $cTmp = array_shift($this->childTrans);
            $stmt = $this->db->prepare("COMMIT TRAN [$cTmp];");
            $stmt->execute();
        }

        return  $stmt;
    }

    public function close(){
        $this->db = null;
    }

    public function connect(){

        try {
            $this->db = new PDO ("dblib:host=$this->hostname:$this->port;dbname=$this->dbname", "$this->username", "$this->pwd");

          

        } catch (PDOException $e) {
            $this->logsys .= "Failed to get DB handle: " . $e->getMessage() . "\n";
        }

    }

}

$hostname = "198.71.225.146";
$port = "1433";
$dbname = "owebpro_recipe";
$username = "RecipeAPI";
$pwd = "Z00$recQ1@n";

try {
	$conn = new pdo_dblib_mssql($hostname, $port, $dbname, $username, $pwd);
} catch ($e) {
		echo "fail";
}

*/
