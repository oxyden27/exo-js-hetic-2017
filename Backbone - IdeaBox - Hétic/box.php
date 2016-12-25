<?php
  session_start();
?>
<script id="result-template" type="text/template">
  <h3><b><%= title %></b><small> par <%= author %> <i>le <%= date %></i></small></h3>
  <p><%= text %></p>
  <p>Nombre de votes: <%= count %>. <a href="#" class="vote">Voter pour cette idée !</a></p>
  <hr>
</script>

<div class="class-header">
  <center><h1>Idea BOX</h1></center>
</div>
<h2 class="text-left">Connecté en tant que : <?php echo $_SESSION['user']; ?></h2>
<form id="form-idea">
  <div class="form-group">
    <label class="sr-only" for="title">Titre de votre idée</label>
  <input type="text" class="form-control" id="title" placeholder="Titre de l'idée..." required>
</div>
<div class="form-group">
  <label class="sr-only" for="idee">Idée</label>
  <textarea class="form-control" id="idee" placeholder="Idée" required></textarea>
</div>
<div class="form-group">
  <button class="btn btn-primary" type="submit">Envoyé</button>
</div>
</form>
<hr>
<div id="result"></div>

<script src="js/main.js"></script>
