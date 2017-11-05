# meta-sinatra
first try at a web frontend to [metadb](https://github.com/ameba23/meta-database) using Sinatra


## live demo
Live demo at [http://185.203.118.36](http://185.203.118.36).  This is under active development and may go down or change.

## Configuration

This requires a connection to a couchdb instance with the database to use.  This can be defined in a yaml file called 'metadb.conf' containing:

```
db: http://host:5984/dbname
```

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

This is designdoc.json, and can be added or updated with:

```
cat designdoc.json | curl -H "Content-Type: application/json" -d @- -X POST http://$DB/_design/tryit
```


