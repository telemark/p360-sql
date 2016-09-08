#! /usr/bin/env node
'use strict'

// External requirements
var fs = require('fs')
var opn = require('opn')

// Local requirements
var getListFromDb = require('./index')
var query = process.argv[2]
var filename = query + '.txt'

getListFromDb(query, (err, data) => {
  if (err) {
    console.error(err)
    process.exit(1)
  }

  var list = []

  data.forEach(function (item) {
    list.push(JSON.stringify(item))
  })

  fs.writeFileSync(filename, list.join('\n'))

  opn(filename)

  process.exit(0)
})
