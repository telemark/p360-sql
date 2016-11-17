'use strict'

// External requirements
const fs = require('fs')

require.extensions['.sql'] = function (module, filename) {
  module.exports = fs.readFileSync(filename, 'utf8')
}

module.exports = {
  duplicateStudentFolders: require('./sql/duplicateStudentFolders.sql'),
  duplicateContacts: require('./sql/duplicateContacts.sql'),
  usersByAccessGroup: require('./sql/usersByAccessGroup.sql'),
  usersByRole: require('./sql/usersByRole.sql'),
  usersByRoleSaksbehandler: require('./sql/usersByRoleSaksbehandler.sql'),
  usersByRoleLeder: require('./sql/usersByRoleLeder.sql'),
  accessGroupsOnCase: require('./sql/accessGroupsOnCase.sql')
}

