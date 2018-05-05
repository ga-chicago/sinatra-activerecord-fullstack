class ItemController < ApplicationController

	#index route

	get '/' do
		'this is get route in ItemController'

	end

	#add route

	get '/add' do
		
		@page = "Add Item"
		@action = "/items"
		@method = "post"
		@placeholder = "Enter your item!"
		@value = ""
		@buttontext = "Add Item"

		erb :add_item #this view will be created in the next step
	end

	#create route

	post '/' do
		puts 'HERE IS THE PARAMS ------------------------------------'
		pp params
		puts '----------------------------------------'
		'you posted. check your terminal'

	end



end

