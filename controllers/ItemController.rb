class ItemController < ApplicationController

	before do
		if !session[:logged_in]
			session[:message] = 'You must be logged in to do that'
			redirect '/user/login'
		end
	end

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
		@item.user_id = session[:user_id] #this will change later
		@item.save

		session[:message] = "You added item \##{@item.id}."

		# @item.to_json
		redirect '/items'
	end

	#delete route

	delete '/:id' do
		@item = Item.find params[:id]
		@item.destroy

		session[:message] = "You deleted item \##{@item.id}"

		redirect '/items'
	end

	#edit route

	get '/edit/:id' do 
		@item = Item.find params[:id]
		@page = "Edit Item #{@item.id}"
		erb :edit_item

	end

	#update route

	patch '/:id' do
		@items = Item.where(id: params[:id])
		@item = @items[0]

		@item.title = params[:title]
		@item.save

		session[:message] = "You updated item \##{@item.id}"
		redirect '/items'
	end




end
