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

	get '/gossips/find_gossip/' do #ouvre un formulaire. Tu peux choisir toi même ton gossip
		puts "kirikou"
  		erb :find_gossip
	end

	post '/gossips/id/' do #grâce au formulaire tu peux choisir ton potin et l'afficher
		puts params['id'].to_i
  		puts "Hello #{Gossip.find(params['id'].to_i).author} => #{Gossip.find(params['id'].to_i).content}"
  		erb :show, locals: {id: params['id'], author: Gossip.find(params['id'].to_i).author, content: Gossip.find(params['id'].to_i).content}
	end

	get '/gossips/:id/' do #url dynamique permet de retourner le potin à l'adresse /gossips/:id où id est l'index de l'array all_gossips
		puts params['id'].to_i
  		puts "Hello #{Gossip.find(params['id'].to_i).author} => #{Gossip.find(params['id'].to_i).content}"
  		erb :show, locals: {id: params['id'], author: Gossip.find(params['id'].to_i).author, content: Gossip.find(params['id'].to_i).content}
	end

end
