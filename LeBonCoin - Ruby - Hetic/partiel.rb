class Todo

    attr_accessor :title, :tasks
    
	def initialize(title)
	    @title = title
		@tasks = []
	end

    # ajout d'une task à la todolist
    def add(task_title)
        # si différent de nul
        if task_title != nil
            # insertion dans le tab tasks
            tasks << Task.new(@tasks.length + 1, "todo", task_title)
            self.write("Vous venez d'ajouté la tâche suivante : [#{task_title}]")
        end
    end
    
     # Affiche task ID
    def echo(id)
        @task = @tasks.find do |task| task.id == id 
        end
        @task.show
    end

    # lister les tasks de la todolist
    def list(type = "")
        if type == "todo"
            # Find tasks avec state todo
            record = @tasks.find_all { |task| task.state == "todo" }
            record.each do |key, value|
                key.show
            end
        elsif type == "done"
            # Find tasks avec state done
            record = @tasks.find_all { |task| task.state == "done" }
            record.each do |key, value|
                key.show
            end
        elsif type == "all"
            # Find all tasks
            @tasks.each do |key, value|
                key.show
            end
        else 
            p "Vous vous êtes trompés dans votre demande."
        end
    end

    #passer une task au state done
    def done(id)
        @task = @tasks.find do |task| task.id == id 
        end
        @task.state = "Done"
        @task.show
        self.write("#{@task.id} est passé au statut [done].")
    end

    #ouvrir un fichier
    def open
	  File.open("#{@name}.txt", 'a+')
    end
    
    #ecrire dans un fichier
    def write(task_title)
        File.open("#{@name}.txt", 'a+') do |f|
            f.puts "#{task_title}"
           f.close
        end
    end
    
    #importer une tâche
    def importTasks(tasks)
		tasks.each do |description|
			self.add(description)
			self.write("La tâche à bien été importé.")
		end
    end

end

class Task
    
    attr_accessor :id, :state, :description
    
	def initialize(id, state = "todo", description)
	    @id = id
		@state = state
		@description = description
	end
	
	#affichage de la tâche
    def show
        p "#{@description}(#{@id}) : #{@state}"
    end
    

end

todo = Todo.new("Todo Numero Uno")
todo.add('Finir exo')
todo.add('Manger')
todo.add('Dormir')

tasks = ["Sport", "Courses"]
todo.importTasks(tasks)

todo.list('all')

p "-------All task-------"

todo.list('todo')
p "-------All liste a faire-------"

todo.done(1)

todo.list('done')
p "-------Déjà fait-------"
