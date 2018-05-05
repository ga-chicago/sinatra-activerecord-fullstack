class ApplicationController < Sinatra::Base

	require 'bundler'
	Bundler.require()

	get '/' do
		'Hey Cool the server Runs'

	end

end
