# meta-sinatra
first try at a web frontend to metadb using sinatra

* Need to find a way to easily put the couchdb design doc under version control

## Design doc in its current experimental state
'''
{
  "_id": "_design/tryit",
  "_rev": "10-796b403937666537b127d8fedfbade5f",
  "views": {
    "images": {
      "map": "function (doc) {\n  if (doc['File:MIMEType'].substring(0,5) == 'image') {\n    emit(doc['File:MIMEType'], doc['File:FileName']);\n  };\n}"
    },
    "audio": {
      "map": "function (doc) {\n  if (doc['File:MIMEType'].substring(0,5) == 'audio') {\n    emit(doc['File:MIMEType'], doc['File:FileName']);\n  };\n}"
    },
    "files": {
      "map": "function (doc) {\n  if (doc['File:FileName']) {\n    emit(doc['File:FileName'], doc['File:FileSize']);\n  };\n}"
    }
  },
  "language": "javascript"
}
'''
