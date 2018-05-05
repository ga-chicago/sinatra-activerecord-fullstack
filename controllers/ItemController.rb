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
		pp params

		#adding something with ActiveRecord
		@item         = Item.new
		@item.title   = params[:title]
		@item.user_id = nil #this will change later
		@item.save

		@item.to_json
	end
end
