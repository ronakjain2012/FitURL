/* eslint-disable no-var */
/* eslint-disable prefer-const */
'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')
const UrlSetting = use('App/Models/UrlSetting')
const moment = require('moment-timezone')

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
      email_valid: /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i,
      mobile_valid: /^(\+7|7|8)?[\s-]?\(?([0-9]{3})\)?[\s-]?([0-9]{3})[\s-]?([0-9]{2})[\s-]?([0-9]{2}).*$/gm,
      domain_match: /:\/\/(.[^/]+)/,
      alphanumeric_valid: /^[a-z0-9]+$/i,
      number_valid: /^\d+$/,
      decimal_number: /^[0-9]+\.?[0-9]*$/,
      alphanumeric_underscore_valid: /^[A-Za-z]\w*$/,
      // valid_url: ^(?:http(s)?:\/\/)?[\w.-]+(?:\.[\w\.-]+)+[\w\-\._~:/?#[\]@!\$&'\(\)\*\+,;=.]+$,
      password: /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[_\W]).{12,20}$/,
      // Minimum ten and maximum 20 characters,one uppercase, lowercase, number, special character
      special_characters: /[~`!$%\^&+=\[\]';{}|":<>\?]/
    }
  }

  static async short(data) {
    var validation = await this.urlValidations(data)
    if (validation.status) {
      let thisModel = await this.createNew(data)
      return thisModel.short_url
    } else {
      return validation.errors
    }
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
   * @returns {status: Bool, errors: Object}
   */

  static async urlValidations(data) {
    let validation = { status: true, data: {} }
    let aliasModel = await this.query()
      .where('special_url', data.special_url)
      .where('original_url', data.special_url)
      .getCount()
    let currentTimezone = data.timezone || 'UTC'
    moment.tz.setDefault(currentTimezone)
    let currentDate = moment()
      .utc()
      .format('YYYYMMDD')
    let currentTime = moment()
      .utc()
      .format('HHmm')
    if (!data.original_url) {
      validation.errors.original_url = 'URL is Required.'
    }
    if (data.special_url) {
      validation.errors.special_url =
        'URL Alias should not contain special charecters except underscore (_) or hypen (-)'
    }
    if (
      data.special_url &&
      !data.special_url.match(this.RegEx.url_alias_invalid)
    ) {
      validation.errors.special_url = 'URL Alias Invalid'
    }
    if (aliasModel) {
      validation.errors.special_url = 'URL Alias not available'
    }
    if (data.expire_date) {
      data.expire_date = moment(data.expire_date, 'YYYY-MM-DD')
        .tz('UTC')
        .format('YYYYMMDD')
      if (data.expire_date < currentDate) {
        validation.errors.expire_date = 'Invalid date.'
      }
    }
    if (data.expire_time) {
      data.expire_time = moment(
        `1996-03-07 ${data.expire_time}`,
        'YYYY-MM-DD HH:mm'
      )
        .tz('UTC')
        .format('HHmm')
      if (data.expire_time < currentTime) {
        validation.errors.expire_time = 'Invalid date.'
      }
    }
    return validation
  }
}

module.exports = ShortUrl
