const runSql = require('./index')
runSql('usersByAccessGroup', (err, data) => {
  console.log(err || data)
  process.exit(0)
})
