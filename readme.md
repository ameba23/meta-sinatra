# meta-sinatra

a web frontend to [metadb](https://github.com/ameba23/meta-database) using Sinatra (in alpha)


## live demo

Live demo on heroku at [meta-db.herokuapp.com/](https://meta-db.herokuapp.com/).  
This is under active development and may go down or change.

## Configuration

This requires a connection to a couchdb instance with the database to use.  This can be defined in a yaml file called 'metadb.conf' containing:

```
db: http://username:password@host:5984/dbname
```
or an enviroment variable called 'DB_URL' with the url. 


## Quick way to dump json from file into couchdb using curl

```
cat file.json | curl -H "Content-Type: application/json" -d @- -X POST http://$DB/_bulk_docs
```

where $DB is the location of couchdb database, eg: 'http://user:password@localhost:5984/metadb'

Note that the json file must contain documents wrapped into "docs" like so and have the correct MIME type as specified in the curl command above:

```
{
  "docs": [
    {
        "_id": "something",
        "anotherfiled": "somethingelse"
    }
  ]
}
```

## CouchDB Design doc

This is included in the repository as designdoc.json, and can be added or updated with:

```
cat designdoc.json | curl -H "Content-Type: application/json" -d @- -X POST http://$DB/_design/tryit
```


