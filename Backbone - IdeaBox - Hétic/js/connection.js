(function($) {
    $("#form-connection").submit(function(e) {
      var $id = $("#identifiant");
      var $mdp = $("#mdp");
      var $warning = $("#warning");
      var $alertId = $("#alert-identifiant");
      var $alertMdp = $("#alert-mdp");
      var alert = [$warning, $alertId, $alertMdp];
      for(var i = 0; i < alert.length; i++){
        var div = alert[i];
        if(!div.hasClass("hidden"))
          div.addClass("hidden");
      }

      if($id.val() != "" && $mdp.val() != "") {
        $.ajax({
          url: "auth.php",
          data: {
            login: $id.val(),
            pwd: $mdp.val()
          },
          dataType: "json",
          method: "post",
          success: function(reponse) {
            if(reponse.status == true) {
              $("#connection").addClass("hidden");
              $("#contenu").load("box.php");
            } else if(reponse.status == false) {
              if(reponse.e == "login")
                $alertId.removeClass("hidden");
              else if(reponse.e == "pwd")
                $alertMdp.removeClass("hidden");
              else
                $alert.removeClass("hidden");
            }
          }
        });
      } else {
        alert("Erreur dans l'identification");
      }

      e.preventDefault();
      return false;
    });
})(jQuery);
