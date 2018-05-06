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
		params.to_json
	end

end