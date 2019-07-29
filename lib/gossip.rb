require 'csv'
class Gossip
	attr_reader :author, :content

	def initialize (author, content) #initialisation de la class Gossip avec ses deux variables
		@author = author
		@content = content
	end 

	def save #écris dans le fichier csv gossip.csv de notre directory db les deux variables params saisies dans notre new_gossip.erb (directory views)
  		CSV.open('./db/gossip.csv', "ab") do |csv|
    		csv << [@author, @content]
  		end
	end

	def self.all #affichage de l'ensemble de nos gossips dans l'index | un potin est instancié dans la class Gossip puis insérer dans un array. Cette array est affiché dans notre index.erb de notre directory views
		all_gossips = []
		CSV.read('./db/gossip.csv').each do |csv_line|
			all_gossips << Gossip.new(csv_line[0], csv_line[1])
		end
		return all_gossips
	end

	def self.find(id) #une methode find semblable à all qui retourne un index du tableau all_gossips (tableau d'instances de Gossip). On cherche à afficher un potin en particulier.
		all_gossips = []
		CSV.read('./db/gossip.csv').each do |csv_line|
			all_gossips << Gossip.new(csv_line[0], csv_line[1])
		end
		return all_gossips[id]
	end
end