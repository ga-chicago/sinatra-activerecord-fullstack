class ItemController < ApplicationController

	#index route

	get '/' do
		@items = Item.all
		# @items.to_json
		@page = 'Index of items'
		erb :item_index

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

		# @item.to_json
		redirect '/items'
	end
end
