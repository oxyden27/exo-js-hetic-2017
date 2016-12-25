(function($, Backbone) {

  // Model
  var IdeeModel = Backbone.Model.extend({
    defaults: {
      title: "", // Titre
      text: "", // Descriptif
      author: "", // Auteur
      date: "", // Date
      count: 0 // Nombre de votes
    },


  });

  // Collection
  var IdeeCollection = Backbone.Collection.extend({
      model: IdeeModel
  });
  // List Collection
  var ideeList = new IdeeCollection();

  // View
  var IdeeView = Backbone.View.extend({
    model: new IdeeModel(),
    tagName: "div",

    events: {
      "click .vote": "onVote"
    },

    onVote: function(e) {
      e.preventDefault();
      var nb = this.model.get("count");
      this.model.set("count", nb + 1);
    },

    initialize: function() {
      this.template = _.template($("#result-template").html());
    },

    render: function() {
      this.$el.html(this.template(this.model.toJSON()));
      return this;
    }
  });

  // Collection View
  var IdeesView = Backbone.View.extend({
    model: ideeList,
    el: $("#result"),

    initialize: function() {
      this.model.on("add", this.render, this);
      this.model.on("change", this.render, this);
    },

    render: function() {
      var self = this;
      self.$el.html('');
      ideeList.each(function(idee) {
        var newView = new IdeeView({ model: idee});
        self.$el.append(newView.render().$el);
      });

      return this;
    }
  });

  $(document).ready(function() {
    $("#form-idea").submit(function(event) {
      var date = new Date();
      var jour = date.getDate();
      var mois = date.getMonth()+1;
      var an = date.getFullYear();
      var heure = date.getHours();
      var minutes = date.getMinutes();
      var idee = new IdeeModel({title: $("#title").val(), text: $("#idee").val(), date: jour+"/"+mois+"/"+an+" à "+heure+":"+minutes, author: login, count: 0});
      ideeList.add(idee);

      $("#title").val("");
      $("#idee").val("");

      event.preventDefault();
      return false;
    });
    var appView = new IdeesView();
  });
})(jQuery, Backbone);
