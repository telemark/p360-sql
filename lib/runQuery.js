'use strict'

const sql = require('mssql')
const config = require('../config')

module.exports = (query, callback) => {
  if (!query) {
    return callback(new Error('Missing required input: query'), null)
  }
  const connection = new sql.Connection(config.p360, function (err) {
    if (err) {
      console.log(query)
      return callback(err)
    }
    const request = new sql.Request(connection)
    request.query(query, function (err, recordset) {
      if (err) {
        console.log(query)
        return callback(err, null)
      } else {
        return callback(null, recordset)
      }
    })
  })
}
