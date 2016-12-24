ideeList = new Mongo.Collection("ideeList");

Meteor.methods({
	//ajout idée
	insertIdea: function(idea) {
		newList = ideeList.insert({
			titre: idea.titre,
			idee: idea.idee,
			date: idea.date,
			author: idea.author,
			votes: idea.votes
		});
		return newList;
	},

	// MAJ Idée
	updateCounter: function(idea) {
		var votes = idea.votes;
		votes.push(idea.author);
		ideeList.update(
			idea.id, {
				$set: {
					votes: votes
				}
			}
		);
	},

	// Edit title and content idée
	editIdea: function(idea) {
		var field = idea.field;
		var set = {};
		set[field] = idea.edit;
		ideeList.update(
			idea.id, {
				$set: set
			}
		);
	},

	// supprimer une idée
	deleteIdea: function(idea) {
		ideeList.remove(idea.id);
	}
});