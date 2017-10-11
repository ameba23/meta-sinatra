require 'sinatra'
require 'json'
require 'rest_client'
require 'thin'

# todo:
#   use hash as _id
#   view x recently added files on front page -need to add timestamp?
#   wirte view to calculate approximate sizes
#   switch to slim beofre doing too much more html
#   add page for each file

DB = 'http://localhost:5984/metadb'

def numberfiles
  data2 = RestClient.get "#{DB}/_design/tryit/_view/files"
  data3 = JSON.parse(data2)
  return data3['total_rows']
end

def numberaudio
  data3 = JSON.parse(RestClient.get "#{DB}/_design/tryit/_view/audio")
  return data3['total_rows']
end

def numberimages
  data3 = JSON.parse(RestClient.get "#{DB}/_design/tryit/_view/images")
  return data3['total_rows']
end

def somefiles
  numfiles = 10
  data3 = JSON.parse(RestClient.get "#{DB}/_design/tryit/_view/files")
  # *** first check there are at least x files
  if data3['rows'].length > numfiles
    return data3['rows'][0..numfiles]
  else 
    return data3['rows'][0..data3['rows'].length]
  end
end

get '/' do
  data = RestClient.get "#{DB}/_all_docs"
  @result = JSON.parse(data)
  #result['rows'].each do |item|    
  #  data2 = RestClient.get "#{DB}/#{item['id']}"
    #result1 = JSON.parse(data2)
    #if result1['_id'].include? "_design"
    #else 
    #  @result2 = result1
    #end
    #@result2 = item['id']
  #end
  erb :index
end

get '/audio' do
  "should list first x audio files"
end
get '/images' do
  "should list first x image files"
end
