require 'sinatra'
require 'pry'

def search(cmd)
  @command = cmd
  @man_page = `man #{@command}`
end

get '/' do
  erb :index
end

get '/command_line' do
  @cmd = ['cp', 'ls', 'mkdir', 'touch', 'mv']
  erb :command_line
end

get '/search' do
  erb :search
end

get '/command_result/:cmd' do
  search(params[:cmd])
  erb :command_result
end

post '/command_result' do
  search(params[:cmd])
  erb :command_result
end