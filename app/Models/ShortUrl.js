'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')

class ShortUrl extends Model {
  static get table() {
    return 'short_urls'
  }
  static get primaryKey() {
    return '_id'
  }
  static get deleteTimestamp() {
    return null
  }
  static get dateFormat() {
    return 'YYYY-MM-DD HH:mm:ss'
  }
}

module.exports = ShortUrl
