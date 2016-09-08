'use strict'

module.exports = {
  p360: {
    user: process.env.P360_DUPLICATE_CONTACTS_USER || 'username', // Database username
    password: process.env.P360_DUPLICATE_CONTACTS_PASSWORD || 'password', // Database passord
    server: process.env.P360_DUPLICATE_CONTACTS_SERVER || 'hostname.domain.no', // You can use 'localhost\\instance' to connect to named instance
    database: process.env.P360_DUPLICATE_CONTACTS_DATABASE || 'DBNAME' // Database name
  }
}
