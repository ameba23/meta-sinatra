#require 'sinatra'
require 'json'
require 'rest_client'

DB = 'http://localhost:5984/metadb'

#get '/' do
data = RestClient.get "#{DB}/_all_docs"
result = JSON.parse(data)
result['rows'].each do |item|
  puts item['id']
end
#end
