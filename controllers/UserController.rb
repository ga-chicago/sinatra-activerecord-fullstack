class UserController < ApplicationController

	get	'/' do
		redirect '/user/login'
	end

	get '/login' do
		erb :login
	end

	get '/register' do
		erb :register
	end

	post '/login' do

		# params.to_json

		@user = User.find_by(username: params[:username])
		session[:user_id] = @user.id

		if @user && @user.password == params[:password]
			session[:username] = @user.username
			session[:logged_in] = true
			session[:message] = "Logged in as #{@user.username}"
			redirect '/items'

		else 
			session[:message] = "Invalid username or password."
			redirect '/user/login'
		end

	end

#why the post route only work with the user/register?
	post '/user/register' do
		@user = User.new
		session[:user_id] = @user.id
		@user.username = params[:username]
		@user.password = params[:password]
		@user.save
		session[:logged_in] = true
		session[:username] = @user.username
		session[:message] = "Thank you for registering as #{@user.username}. Enjoy the site!"
	end

	get '/logout' do
		session[:username] = nil
		session[:logged_in] = false
		session[:user_id] = nil
		redirect '/user/login'
	end

end