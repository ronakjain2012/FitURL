'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')

class UrlSetting extends Model {
  static get table() {
    return 'url_settings'
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

module.exports = UrlSetting
