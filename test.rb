require 'sinatra'
require 'json'
require 'rest_client'

DB = 'http://localhost:5984/metadb'

get '/' do
  data = RestClient.get "#{DB}/_all_docs"
  result = JSON.parse(data)
  result['rows'].each do |item|    
    data2 = RestClient.get "#{DB}/#{item['id']}"
    result1 = JSON.parse(data2)
    if result1['_id'].include? "_design"
    else 
      @result2 = result1
    end
    #@result2 = item['id']
  end
  erb :index
end
