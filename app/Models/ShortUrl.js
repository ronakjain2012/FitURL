'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')

class ShortUrl extends Model {
  static padding = 100
  static charSet =
    'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
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

  static async short(data) {
    let dataModel = await this.findBy('original_url', data.original_url)
    if (dataModel) {
      if (dataModel.force_disabled) {
        dataModel = this.createNew(data)
      } else {
        return dataModel.short_url
      }
      return dataModel._id
    } else {
      dataModel = new this()
      dataModel.original_url = data.original_url
      dataModel.special_url = data.special_url
      const domainRegEx = /:\/\/(.[^/]+)/
      dataModel.domain = data.original_url.match(domainRegEx)[1]
      await dataModel.save()
      return dataModel._id
    }
  }

  static async createNew(data) {
    let dataModel = new this()
    dataModel.original_url = data.original_url
    dataModel.special_url = data.special_url
    const domainRegEx = /:\/\/(.[^/]+)/
    dataModel.domain = data.original_url.match(domainRegEx)[1]
    await dataModel.save()
    return dataModel
  }

  static encodedUrl(_id) {}

  static decodeUrl(url) {}
}

module.exports = ShortUrl
