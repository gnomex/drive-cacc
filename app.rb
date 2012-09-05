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

get '/upload' do
  @disciplines = Discipline.all
  @teachers = Teacher.all
  erb :upload
end

post '/upload' do
  filesize = File.size(params[:file][:tempfile])

  @archive = Archive.new(name: params[:name], description: params[:description], year: params[:year], discipline_id: params[:discipline], teacher_id: params[:teacher], filesize: filesize)

  path = "/tmp/#{@archive.id}.#{params[:file][:filename].split(".").last}"

  File.open(path, "w") do |f|
    f.write(params['file'][:tempfile].read)
  end

  @archive.path = path

  @archive.save

  redirect '/'
end