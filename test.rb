require 'sinatra'
require 'json'
require 'rest_client'
require 'thin'
require 'slim'

# todo:
#   use hash as _id
#   view x recently added files on front page -need to add timestamp?
#   wirte view to calculate approximate sizes
#   read db name from config file?
#   use couchrest or somethign similar?
#   switch to rails?

DB = 'http://localhost:5984/metadb'


def numberof(filetype)
  data = JSON.parse(RestClient.get "#{DB}/_design/tryit/_view/#{filetype}")
  return data['total_rows']
end

def somefiles(filetype)
  numfiles = 50
  data = JSON.parse(RestClient.get "#{DB}/_design/tryit/_view/#{filetype}")
  # *** first check there are at least x files
  if data['rows'].length > numfiles
    return data['rows'][0..numfiles]
  else 
    return data['rows'][0..data['rows'].length]
  end
end

get '/' do
  @page_title = ''
  # @result = JSON.parse(RestClient.get "#{DB}/_all_docs")
  slim :index
end

# Pages listing files by category (eg: audio)
get '/filetype/:filetype' do
  @page_title = params[:filetype]
  @filetype = params[:filetype]
  slim :bytype
end

# Pages for individual files:
get '/files/:hash' do
  @page_title = params[:hash]
  @hash = JSON.parse(RestClient.get "#{DB}/#{params[:hash]}")
  slim :hash
end

post '/updatesite' do
  system('touch hello.txt')  
end 
