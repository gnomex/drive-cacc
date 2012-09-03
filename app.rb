require "./config/boot"

get '/' do
  @archives = Archive.all
  erb :index
end

get '/download/:id' do
  @archive = Archive.find(params[:id])
  send_file @archive.path, filename: @archive.name
end