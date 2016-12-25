<?php
  $bdd = array(
    'luc' => 'marie',
    'eric' => 'priou',
  );

  foreach($bdd as $idBDD => $mdpBDD){
    $id = $_POST['login'];
    $mdp = $_POST['pwd'];

    if(isset($id) && isset($mdp)) {
      if($id == $idBDD && $mdp == $mdpBDD) {
        session_start();
        $_SESSION['user'] = $id;
        echo json_encode(array("status" => true));
      } else {
        if($id != $idBDD)
          echo json_encode(array("status" => false, "e" => "login"));
        if($mdp != $mdpBDD)
          echo json_encode(array("status" => false, "e" => "pwd"));
      }
    } else {
      echo json_encode(array("status" => false));
    }
  }
?>
