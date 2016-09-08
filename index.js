'use strict'

// Local requirements
const runQuery = require('./lib/runQuery')
const query = require('./lib/queries')
const validTypes = ['duplicateStudentFolders', 'duplicateContacts', 'usersByAccessGroup', 'usersByRole', 'accessGroupsOnCase']

module.exports = (type, callback) => {
  if (!type) {
    return callback('Missing required input: type', null)
  }
  if (validTypes.indexOf(type) === -1) {
    return callback('Invalid type. Valid types are ' + validTypes.join(', '), null)
  }

  runQuery(query[type], function (err, data) {
    if (err) {
      return callback(err)
    }
    return callback(null, data)
  })
}
