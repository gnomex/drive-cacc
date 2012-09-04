# coding: utf-8
require "./config/boot"

get '/' do
  @archives = Archive.all
  erb :index
end

get '/download/:id' do
  @archive = Archive.find(params[:id])

  if File.exists?(@archive.path)
  	@archive.inc(:downloads, 1)
  	send_file @archive.path, filename: @archive.snake_case
  else
  	redirect '/file_not_found'
  end
end

get '/file_not_found' do
	erb :file_not_found
end