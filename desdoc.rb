require 'json'
require 'rest_client'
require 'yaml'


# load db location from config file:
if File.exist?("metadb.conf")
  DB = YAML.load_file("metadb.conf")["db"]
else
  DB = 'http://localhost:5984/metadb'
end



desdoc = JSON.parse(File.read('designdoc.json'))
desdoc['_rev'] = JSON.parse(RestClient.get "#{DB}/_design/tryit/")['_rev']
data = JSON.parse(RestClient.put "#{DB}/_design/tryit/", desdoc.to_json, {:content_type => :json} )
puts data
