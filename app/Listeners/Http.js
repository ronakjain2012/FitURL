'use strict'

const Database = use('Database')

const Http = (exports = module.exports = {})

Http.method = async () => {}

Http.onStart = function() {
  // Database.on('query', console.log)
  Database.on('sql', console.log)
}
