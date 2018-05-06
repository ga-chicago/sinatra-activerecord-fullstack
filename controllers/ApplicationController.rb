class ApplicationController < Sinatra::Base

	require 'bundler'
	Bundler.require()

	ActiveRecord::Base.establish_connection(
		adapter:  'postgresql',
		database: 'item'
	)

	set :views, File.expand_path('../views', File.dirname(__FILE__))
	use Rack::MethodOverride
	set :method_override, true

	get '/' do
		@page = "Hello"
		erb :hello
	end
end
