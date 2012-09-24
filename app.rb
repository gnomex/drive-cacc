# coding: utf-8
require "./config/boot"

helpers do
  def protected!
    unless authorized?
      response['WWW-Authenticate'] = %(Basic realm="Give your credentials")
      throw(:halt, [401, "Not authorized!\n"])
    end
  end

  def authorized?
    @auth ||=  Rack::Auth::Basic::Request.new(request.env)
    @auth.provided? && @auth.basic? && @auth.credentials && @auth.credentials == ['admin', 'admin']
  end
end

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

#
# Protected areas

get '/admin' do
  protected!
  @disciplines = Discipline.asc(:name)
  @teachers = Teacher.asc(:name)
  erb :admin
end

# Creating new discipline
post '/discipline' do
  protected!

  discipline = Discipline.create(name: params[:name])

  content_type :json
  discipline.to_json
end

# Remove a discipline
delete '/discipline' do
  protected!

  discipline = Discipline.find(params[:id])
  discipline.destroy

  content_type :json
  discipline.to_json
end

# Creating new teacher
post '/teacher' do
  protected!

  teacher = Teacher.create(name: params[:name])

  content_type :json
  teacher.to_json
end

# Remove a teacher
delete '/teacher' do
  protected!

  teacher = Teacher.find(params[:id])
  teacher.destroy

  content_type :json
  teacher.to_json
end