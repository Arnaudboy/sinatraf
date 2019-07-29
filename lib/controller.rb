require 'gossip'
class ApplicationController < Sinatra::Base
	get '/' do #Le controller affiche notr index
  		erb :index, locals: {gossips: Gossip.all}
	end

	get '/gossips/new/' do #Le controller affiche le formulaire de création de gossip
  		erb :new_gossip
	end

	post '/gossips/new/' do#Le controler utilise la méthode save de la classe Gossip pour sauvegarder le gossip et nous redirige vers l'index
  		Gossip.new(params["gossip_author"], params["gossip_content"]).save
  		redirect '/'
	end

	get '/gossips/:id/' do |id| #utilise une variable id pour trouver une instance de Gossip dans notre array -> voir méthode find de class Gossip
		puts "kirikou"
  		erb :find_gossip, locals: {id: id, gossip: Gossip.find(id.to_i - 1)}

	end

	post '/gossips/id/' do #retourne dans le terminal l'id entrée ainsi que le potin
		puts params['id']
  		puts "Hello #{Gossip.find(params['id'].to_i).author} => #{Gossip.find(params['id'].to_i).content}"
	end

end
