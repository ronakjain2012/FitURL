'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')
const moment = require('moment-timezone')

class Session extends Model {
  static get table() {
    return 'sessions'
  }
  static get primaryKey() {
    return 'id'
  }
  static get deleteTimestamp() {
    return null
  }
  static get dateFormat() {
    return 'YYYY-MM-DD HH:mm:ss'
  }

  static async addAndUpdate(session) {
    let thisModel = await this.query()
      .whereNull('deleted_at')
      .where('session', session.session_id)
      .first()
    if (
      thisModel &&
      session.session_data &&
      session.session_data.expire_at >=
        moment()
          .utc()
          .format('X')
    ) {
      if (thisModel.ip !== session.ip) {
        thisModel = await this.createThis(session)
      } else {
        thisModel.visit_count++
        thisModel.time_end = moment(
          thisModel.updated_at || thisModel.created_at,
          'YYYY-MM-DD HH:mm:ss'
        ).format('YYYY-MM-DD HH:mm:ss')
        thisModel = await this.updateThis(thisModel, session)
      }
    } else {
      thisModel = await this.createThis(session)
    }
    return {
      session_id: thisModel.session,
      genrated_at: moment(thisModel.created_at, 'YYYY-MM-DD HH:mm:ss').format(
        'X'
      ),
      expire_at: moment(
        thisModel.updated_at || thisModel.created_at,
        'YYYY-MM-DD HH:mm:ss'
      )
        .add(1, 'h')
        .format('X')
    }
  }

  static async createThis(session) {
    let thisModel = new this()
    thisModel.session = session.session_id_new
    thisModel.region = session.region || null
    thisModel.country = session.country || null
    thisModel.country_code = session.country_code || null
    thisModel.state = session.state || null
    thisModel.city = session.city || null
    thisModel.zip_code = session.zip_code || null
    thisModel.iso_code = session.iso_code || null
    thisModel.lat = session.lat || null
    thisModel.long = session.long || null
    thisModel.postal_code = session.postal_code || null
    thisModel.area_code = session.area_code || null
    thisModel.metro_code = session.metro_code || null
    thisModel.ip = session.ip || null
    thisModel.visit_count = 1
    thisModel.agent = session.agent || null
    thisModel.isp = session.isp || null
    thisModel.org = session.org || null
    thisModel.business_name = session.business_name || null
    thisModel.business_website = session.business_website || null
    thisModel.timezone = session.timezone || 'UTC'
    thisModel.raw_data = session.raw_data || null
    await thisModel.save()
    return thisModel
  }

  static async updateThis(thisModel, session) {
    thisModel.session = session.session_id
    thisModel.region = session.region || null
    thisModel.country = session.country || null
    thisModel.country_code = session.country_code || null
    thisModel.state = session.state || null
    thisModel.city = session.city || null
    thisModel.zip_code = session.zip_code || null
    thisModel.iso_code = session.iso_code || null
    thisModel.lat = session.lat || null
    thisModel.long = session.long || null
    thisModel.postal_code = session.postal_code || null
    thisModel.area_code = session.area_code || null
    thisModel.metro_code = session.metro_code || null
    thisModel.ip = session.ip || null
    thisModel.agent = session.agent || null
    thisModel.isp = session.isp || null
    thisModel.org = session.org || null
    thisModel.business_name = session.business_name || null
    thisModel.business_website = session.business_website || null
    thisModel.timezone = session.timezone || 'UTC'
    thisModel.raw_data = session.raw_data || null
    await thisModel.save()
    return thisModel
  }
}

module.exports = Session
