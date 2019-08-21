/* eslint-disable prefer-const */
'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')
const UrlSetting = use('App/Models/UrlSetting')
const moment = require('moment')

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

  static get domainRegEx() {
    return /:\/\/(.[^/]+)/
  }

  static get RegEx() {
    return {
      url_alias_invalid: /[~`!#$ .%\^&*+=\-\[\]\\';,/{}|\\":<>\?]/g,
      username_invalid: /[~`!#$%\^&*+=\-\[\]\\';,/{}|\\":<>\?]/,
      email_valid: '',
      mobile_valid: '',
      domain_match: /:\/\/(.[^/]+)/,
      alphanumeric_valid: /^[a-z0-9]+$/i,
      number_valid: /^\d+$/,
      alphanumeric_underscore_valid: /^[A-Za-z]\w*$/,
      // valid_url: ^(?:http(s)?:\/\/)?[\w.-]+(?:\.[\w\.-]+)+[\w\-\._~:/?#[\]@!\$&'\(\)\*\+,;=.]+$,
      password: /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[_\W]).{12,20}$/
      // Minimum ten and maximum 20 characters,one uppercase, lowercase, number, special character
    }
  }

  static async short(data) {
    let thisModel = await this.createNew(data)
    return thisModel.short_url
  }

  static async createNew(data) {
    let thisModel = new this()
    thisModel.original_url = data.original_url
    thisModel.special_url = data.special_url
    thisModel.domain = data.original_url.match(this.domainRegEx)[1]
    await thisModel.save()
    thisModel.short_url = this.encodedUrl(thisModel._id)
    thisModel.partition_index_number = thisModel.short_url.length
    thisModel.partition_index = thisModel.short_url.charAt(0)
    await thisModel.save()
    this.decodeUrl(thisModel.short_url)
    return thisModel
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

  static decodeUrl(shortUrl) {
    let _id = 0
    let chars = this.charSet.split('')
    for (let i = 0; i < shortUrl.length; i++) {
      _id = 62 * _id + chars.indexOf(shortUrl.charAt(i))
    }
    return _id
  }

  /**
   * @description Validation Rules for creating url
   * @param {*} data
   * @returns {status: Bool, data: Object}
   */

  static async urlValidations(data) {
    let validation = { status: true, data: {} }
    let thisModel = await this.findBy('original_url', data.original_url)
    let aliasModel = await ShortUrl.findBy('special_url', data.special_url)
    let settingModel = await UrlSetting.findBy('url_id', thisModel._id)
    if(!data.original_url){
      validation.data.original_url = "URL is Required."
    }
    if(data.special_url){
      validation.data.special_url = "URL Alias should not contain special charecters except underscore (_) or hypen (-)"
    }
    if(data.special_url && !data.special_url.match(this.RegEx.url_alias_invalid)){
      validation.data.special_url = "URL Alias Invalid"
    }

    return validation
  }
}

module.exports = ShortUrl
