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

  static get padding() {
    return 100
  }

  static get charSet() {
    return 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
  }

  static async short(data) {
    let dataModel = await this.findBy('original_url', data.original_url)
    if (dataModel) {
      if (dataModel.force_disabled) {
        dataModel = this.createNew(data)
      } else {
        return dataModel.short_url
      }
      return dataModel.short_url
    } else {
      dataModel = new this()
      dataModel.original_url = data.original_url
      dataModel.special_url = data.special_url
      const domainRegEx = /:\/\/(.[^/]+)/
      dataModel.domain = data.original_url.match(domainRegEx)[1]
      await dataModel.save()
      dataModel.short_url = this.encodedUrl(dataModel._id)
      dataModel.partition_index_number = dataModel.short_url.length
      dataModel.partition_index = dataModel.short_url.charAt(0)
      await dataModel.save()
      this.decodeUrl(dataModel.short_url)
      return dataModel.short_url
    }
  }

  static async createNew(data) {
    dataModel.original_url = data.original_url
    dataModel.special_url = data.special_url
    const domainRegEx = /:\/\/(.[^/]+)/
    let dataModel = new this()
    dataModel.domain = data.original_url.match(domainRegEx)[1]
    await dataModel.save()
    return dataModel
  }

  static encodedUrl(_id) {
    let paddedId = this.padding + _id
    let url = []
    while (paddedId > 0) {
      url.push(this.charSet.split('')[parseInt(paddedId % this.charSet.length)])
      paddedId = parseInt(paddedId / this.charSet.length)
      if (paddedId < 1) {
        paddedId = 0
      }
    }
    return url.reverse().join('')
  }

  static decodeUrl(short_url) {
    let _id = 0
    let chars = this.charSet.split('')
    for(var i=0;i<short_url.length;i++) {
      _id = (62*_id)+chars.indexOf(short_url.charAt(i))
    }
    console.log(_id-this.padding)
  }
}

module.exports = ShortUrl
